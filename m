Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793821948;
	b=pt+0BsnUX6DOrnO1s4f2UGQiJ/mhVl6B53bHzxPYVmXOS9t2khFQRogoDSEjN4H+RvLn
	 zeBHqObrTriFpx3AeDbH1VrezrX2j2pAHt7+++/j9+0sInE7ivRB2de2aeYD89CaBk5l8
	 e5ZJPMs0x7VSirGRBqwTPF87+G4eOBDoAO2KEP0ylTLh/wIEhKMAepd348qYK+QeH3VYm
	 TgEzeCq/HhpDpgQf92dZkcKwAfyGBDs5/7aZa5nqghnzmRKbsQxXOCtYpOTeqVT68Bc6X
	 at0hjFB+vLpCHtLUkk1vJCEbWpsLLHGCeD7ztadS/3IhurQMUq4HOR1GbPlCgJYf/sA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821948;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=pLue9x6BWWrzsb2sVe20++4HPjLCp1G2bwj77yogYNk=;
	b=HRPQY9fdb8XwUWm8OLb0806vV0uVA6SoRnhkSODcAvMx9dZWv8qmi6ZXHF1J5SzqPFwM
	 Pgw9AMHCTeThJbtoWWlpCdLjaBBtgvlyNmNw9N8tCl2yY01WsFNoEqLgl9XZ2UaWa9B23
	 dQf1P+R8ImD1+YEu3MstwNU2k1PzaIi+kO2YUbkr424+veOay4l9+KpOoQir84WSntrmH
	 k6pPcL8FVf6LHEOCn40KqIjSTbx2zVAfcfU5JGpaHtBkc76T/WFZKglEFnpKWJm/et0vN
	 H11rgY4jZPhvnfJzRAzcFttrC7ILmPMHF4LMYiBNBAmSuPIIvsZzm34mkMO1jy+LTBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=GnDegx9h;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C27A6076CD3
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C27A6076CD3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=GnDegx9h
ARC-Seal: i=1; a=rsa-sha256; t=1793821935; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RL/KiHkn559ARasvWtWE6HMGK5UM02TNgh936ORCMohbt7llHXfHRFpURxYxfABPfdVmjTphkAUTCuap3dQeQ8ieXtQprCyoEa8kFzRX6kkLchsSFR6S0WIAe/kHPQ75nLNVDP8CF9g4uOsS3OLJhTVftZPUB+WqgQ36dlKPJT8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793821935; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pLue9x6BWWrzsb2sVe20++4HPjLCp1G2bwj77yogYNk=; 
	b=I6m9W4kj8tzUh8Qt7+k4pYFBJnCP16dWF+cZWJ7dhhYf2DJqDOnz/cZN2oCKoVLzoo8HvWj9FAsjbXNU8o/u238B4p+0ipiLmPYrbZhwmEeIRleGsYN9Lflk3qvVTuqbGrKk2BfiBYgP+shgP1v+0zTjiwR2QbUDDtUQk2+OKzI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: a=rsa-sha256; b=GnDegx9hNjgJ/AZXsiSIo+DayvYw2T7DzFTN6++aWh2kgelLcTVOq4pMIxuixf5U1ruVu3qvmZFodiPylep+EhFn82+Jyr+KN+oyMMEXhU8bvGasPXaq9w6L509HNghkZ9mC8v57NSEfh5680G7v90/q2tWuhu0rEf8vOM7eJO0=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=pLue9x6BWWrzsb2sVe20++4HPjLCp1G2bwj77yogYNk=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 17938219336521015.0986482478506;
	Wed, 4 Nov 2026 11:52:13 -0800 (PST)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Wed, 04 Nov 2026 19:51:54 +0000
Subject: [PATCH v3 2/2] drm/panfrost: Fix race when restoring reset state
 in perfcnt
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-panfrost-reset-races-fixes-v3-2-09868a88c351@collabora.com>
References: <20261104-panfrost-reset-races-fixes-v3-0-09868a88c351@collabora.com>
In-Reply-To: <20261104-panfrost-reset-races-fixes-v3-0-09868a88c351@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1532;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=Niu4bMgW+1MSGrBQXh8uM8TErFzdAq3PS8yb+5mB66U=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBq64zhpGZx/9rBtHZT2fqIeSEBlY74nT6TzSlmT
 hP9AOmS0t+JAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCauuM4QAKCRAOJn5M7lND
 PXFDC/0YNCCzhZeDejnz/yP85EVerVP0YdU3RZw8ENA+sDPW9KZH11vHn4lGtX1WabqpqAMsiDl
 k0e5oT+YDcwrwsS8iqiUDSRZ49TEgpwAVneQnaqSGBqJPXfdNg+npYW7f5PkPy7SGUlgHJKmuIS
 v1E5wPwE3g8PeDk2uayDfKf2pfnSsIj5/+yYJrdDLf5HdBNbrgW7Lmb9YQ7O5Duip8L+pAOAgnU
 8kQor2Yk65WY7iVEgQysLC059lWaj7RIr8xaOOoh9JLWYk9L78ZvKWT8oorWW1ysRQCNcOtai4L
 wIP7z6lnKW7kYH4A32T7ViF1zWWmQFahe/xNbFYPUo03n1+KKsWdyu/03hbLFVK6Wg1I39gh95Z
 vlQtlNjfiS5NWOKcG0U2T/q/NmRGwVwcf9uTGluvCvGLyROUxe+Wr9WjgEOVmpkOgbK32UlJmZV
 6mLPzlcfwm4/oD4xhOjVRWppZyNAaabafgOJy7kq3msFeAEX95ftsV9t3MS9TVLZi54Wo=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

struct panfrost_perfcnt::state should always be updated atomically, both
in the dump ioctl and the reset sequence.

Fixes: 9944dd07f3cf ("drm/panfrost: Fix races between perfcnt and reset sequence")
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
index b26da057a1a0..d50b6cc2ecfa 100644
--- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
+++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
@@ -148,18 +148,17 @@ static int panfrost_perfcnt_dump_locked(struct panfrost_device *pfdev, u32 *stat
 	 */
 	ret = wait_for_completion_interruptible_timeout(&pfdev->perfcnt->dump_comp,
 							msecs_to_jiffies(1000));
-
 	if (!ret)
 		ret = -ETIMEDOUT;
 
-	/* We need to restore perfcnt state so the next successful dump can relay it to UM */
-	if (ret < 0) {
-		perfcnt->state |= *state;
-		*state = 0;
-		return ret;
-	}
-
 	scoped_guard(rwsem_read, &pfdev->reset.lock) {
+		/* Restore perfcnt state so the next successful dump can relay it to UM */
+		if (ret < 0) {
+			perfcnt->state |= *state;
+			*state = 0;
+			return ret;
+		}
+
 		*state |= perfcnt->state;
 
 		/* UM must re-enable their session before requesting new dumps. */

-- 
2.56.0

