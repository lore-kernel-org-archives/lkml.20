Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8EA53161B
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790868930; cv=none; b=Q86XbPjsh7KqUEMpxfqK/8/chIVpfDB5/KjeNSDb4d3oMwIIcQAZbipzSpip5rNulZc7nkD3EBACHdNqOEHhlc+GJEPhkfE5gMRjGECyu0ASwdqdna6iee3UBj9Qf59zaubpwnW6ZFWNHt9jxXfaiVwXZ2qLCxysrFIIWfCYUuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790868930; c=relaxed/simple;
	bh=NiJDzWveMIkvZw75izO1egz+aEAX6DONLRpNMItQL9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UAqwS+zMjODAuGocbOV1akErWdO/zIiFB8imiylgSbBknAgXgi14wipK+8EKaenZvpNeLC8FnJdcjCsFY8uYe0CvPEsGBW/C6eYcP5YImZJ3FS8+r0Y1t2l5syR9Gv9jh6c2CUL4mByB607WgoDPKoGlHXSnC5YiARk4ieJh6Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qiFpuaU6; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qiFpuaU6"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BD711476;
	Thu,  1 Oct 2026 08:35:24 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 434893F86F;
	Thu,  1 Oct 2026 08:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790868927; bh=NiJDzWveMIkvZw75izO1egz+aEAX6DONLRpNMItQL9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qiFpuaU6XiMQ/kXy6XnLO1cQ21VwhMnggQN+3/Klf8I7I/iyY0aWnPkle5ioYDWWr
	 DRRFc6Kg7YCDjGGtbnFYPW8ODA13o3fVpqiaQMOar87bo0Wgo05IOPt3U0DhKRcVjP
	 eqalrYWAfmAuz85YwJhFaciSz42D1Pw344pD7PhI=
From: Andre Przywara <andre.przywara@arm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
	Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Srinivas Ramana <sramana@qti.qualcomm.com>,
	Niyas Sait <niyas.sait@arm.com>,
	Lee Trager <lee@trager.us>,
	Ritwick Sharma <ritwick.sharma@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	linux-acpi@vger.kernel.org--cc,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 09/13] arm_mpam: propagate MSC access errors in mpam_reset_class_locked()
Date: Thu,  1 Oct 2026 17:34:34 +0200
Message-ID: <20261001153439.3295416-10-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001153439.3295416-1-andre.przywara@arm.com>
References: <20261001153439.3295416-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mpam_reset_ris() function can return an error, propagate this up
through mpam_reset_component_locked() to mpam_reset_class_locked(),
which is exported. The external caller is a void function, so cannot
really handle the error at the moment, but at least we report everything
on the MPAM interface side.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c  | 24 ++++++++++++++++++------
 drivers/resctrl/mpam_internal.h |  2 +-
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 60f6a39176ea1..c639aaa5f38e1 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -3007,7 +3007,7 @@ static void mpam_enable_once(void)
 	       mpam_partid_max + 1, mpam_pmg_max + 1);
 }
 
-static void mpam_reset_component_locked(struct mpam_component *comp)
+static int mpam_reset_component_locked(struct mpam_component *comp)
 {
 	struct mpam_vmsc *vmsc;
 
@@ -3021,26 +3021,38 @@ static void mpam_reset_component_locked(struct mpam_component *comp)
 				 srcu_read_lock_held(&mpam_srcu)) {
 		struct mpam_msc *msc = vmsc->msc;
 		struct mpam_msc_ris *ris;
+		int ret;
 
 		list_for_each_entry_srcu(ris, &vmsc->ris, vmsc_list,
 					 srcu_read_lock_held(&mpam_srcu)) {
-			if (!ris->in_reset_state)
-				mpam_touch_msc(msc, mpam_reset_ris, ris);
+			if (!ris->in_reset_state) {
+				ret = mpam_touch_msc(msc, mpam_reset_ris, ris);
+				if (ret)
+					return ret;
+			}
 			ris->in_reset_state = true;
 		}
 	}
+
+	return 0;
 }
 
-void mpam_reset_class_locked(struct mpam_class *class)
+int mpam_reset_class_locked(struct mpam_class *class)
 {
 	struct mpam_component *comp;
+	int ret;
 
 	lockdep_assert_cpus_held();
 
 	guard(srcu)(&mpam_srcu);
 	list_for_each_entry_srcu(comp, &class->components, class_list,
-				 srcu_read_lock_held(&mpam_srcu))
-		mpam_reset_component_locked(comp);
+				 srcu_read_lock_held(&mpam_srcu)) {
+		ret = mpam_reset_component_locked(comp);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 static void mpam_reset_class(struct mpam_class *class)
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 68a6cf2b9cc73..09f8168fb4d2c 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -465,7 +465,7 @@ void mpam_enable(struct work_struct *work);
 void mpam_disable(struct work_struct *work);
 
 /* Reset all the RIS in a class under cpus_read_lock() */
-void mpam_reset_class_locked(struct mpam_class *class);
+int mpam_reset_class_locked(struct mpam_class *class);
 
 int mpam_apply_config(struct mpam_component *comp, u16 partid,
 		      struct mpam_config *cfg);
-- 
2.43.0

