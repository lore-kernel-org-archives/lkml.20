Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BEB33557D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 02:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788920592; cv=none; b=hw+7j+zEhQh8ziFqDOCf2Q0c1/c5tchBrH5FQHnOmXo0Ye0FB9xdAUpUzM5/ny/oVRpCXWJLxkmkA5brhl2AcPmqvoRLaVouSh2DsDO9hutFDq6YWOK9s51o4RvOC3XKzUSbk3ShL+huLsRVnsheSyOJeSFYx7wi2li/Bp0Sp2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788920592; c=relaxed/simple;
	bh=Dh4B4IzBPL7G0fg8fsHyxThTQYw6KbQHxvakwyfWBas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bhnAYj4dJimFKqoPxxhNqrfKWD5zQS6tzO2DYeGR9c8rDsDuG/GUvP9tLr2cbnPLTbZ4mDSss5QHlK1UnWWIpU1vStVyfP1pQ3gDnlW1xKox3qlqPdon98u2QTBB8rjf5CAYNf27+2gdmaSdZmVtHtIiXn2T78Xiz5Tj5m45SrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HasV1NKi; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HasV1NKi"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4a46a53abc9so4222162b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 19:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788920590; x=1789525390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SfaK6q6dasszOEuAIXJYECUIBADGH/4esaoa8zE8RWA=;
        b=HasV1NKiXEoXc340eAcAdvP8oHevuWh3o4wkLhthHKYorK+y1/vqV/VkGTojcnRQw4
         htzHbyeEt5DXeAbdxD3e4ohL43u3a5tBejj93kjesCC9WawgcisCncIfXnqoA83SGzuH
         KKXmNwAQFys14Qog42faVcalDFxpaxt9voDK1o3DnBIEA0RMt3HOeUxGmJYrUwL5Mhn7
         5izAv20kuNU94W8NWZHSYZ5s8gcigakX/Y94Q+ksZy+UbBWl0wwES56KipMQmcE3RY2a
         IyAhORqMngoju24VsKX8KxTf2Acghg3VsO+i1tn1t8XI6LWmxuqTvETeL8+iB7T1NViG
         idQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788920590; x=1789525390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SfaK6q6dasszOEuAIXJYECUIBADGH/4esaoa8zE8RWA=;
        b=Hvj5d2cIH5zFOpnmAETeFiyZFBAXs14vNiunTlBQ3GKziSQD2cHVSHTCxpY28Xk1V2
         ovBJlQhCLAb1yLyDFbhYvaIhoaG1OtFnB7yleYs6xShr6+g1eb3A55qtjiBDBLCe8JdI
         VOewPR/JSNikq1kOKPy4bEzyxd6cpSdBYi4zt7D0FIkZHULFCvsHRccnV1pcbKyRgiBu
         JUjvbjPob7ax+J0PoxwwDW4hAlxak9zwEd5yq6X/nqNxQwR4bHVWmzu8chCUVhbE3qx0
         RspCbk1XaBYKnKg5w0FxiH5SPH6ybBgEcrbjK618SHlK+249OB0mdBe2FPhktSq2aDPY
         aHDw==
X-Forwarded-Encrypted: i=1; AKwUvByvR/FIukk67oBYJROHCJKNTg2zJYr2Z4v4dk7Hb7/VPOclpuBcvQEu4tR+9kAm/vXddISqQWUeTphS5bg=@vger.kernel.org
X-Gm-Message-State: AFuF++lMqPFnnAwKcK6O6JABJ2JCRAegpxuU5r3CO+QSvIZHBzLm4uL2
	NX5b3hajHpBOclp1KWw1S4EaXL+VPoRKI8YrYxyvmBxu4iBxZtv4yu5/
X-Gm-Gg: AYBFou3vxmzj15oAn3vtJD4r3iOkYBW4DT+cGnP0BCau5d56ZUkRF+ow5DSwvkt53mw
	JDAOSKmp78RW81/imdOYQMG9a11gLIk53cNQ6hzROMS2aiqceAaffojPMoTNo3a8lueKALk974s
	Dh5FFfkfZt8ykJxH//X0qWwQuy3qup7ubEOh16AlsRcuboUBEa4wBAi2RDOvCSc6MzM6I9a/3f+
	9cri+8IFlSivc/mCHrcMgyxDRUG9n9M7dQqABp1LwDDjBP1VDZAiD2ep7xTH7tn2ng0WNoqchtf
	KgjpTGI2wO/lyRBU7JiRKQ3vpO0atyZpP6p01XvRYXSVtXevmkCJb/kDva1GIZ/LHLsSstKC8u7
	6Bts+WtLOIWWZpNW7jXuIvVqbC7G8cjTc2KUhbu/LTaR/Dz/y7qY4yXnm9JgCmOGxmla80LAcr3
	m83biPhvr/Mxrgyz14JX7mIkcbk0vuHJKi2a/qIgCFQPLPLQ69MD9f2S6ibSUnyHL13woxn0/Q7
	E7QhmtirzU39gUA58vZqPj3gg==
X-Received: by 2002:a05:6808:c2fa:b0:4b9:e5fa:8909 with SMTP id 5614622812f47-4b9e5fa8d8bmr15799308b6e.28.1788920590066;
        Tue, 08 Sep 2026 19:23:10 -0700 (PDT)
Received: from david-hassan-Inspiron-15-3567 ([69.162.230.54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971aa12cesm15580584b6e.16.2026.09.08.19.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 19:23:08 -0700 (PDT)
From: Fahmy Hassan <fahmymohammed@gmail.com>
To: helgaas@kernel.org,
	bhelgaas@google.com,
	scott@spiteful.org
Cc: fahmymohammed@gmail.com,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v2 4/5] PCI: pciehp: Check pci_hp_add_bridge() return value
Date: Tue,  8 Sep 2026 20:22:25 -0600
Message-ID: <20260909022227.620217-5-fahmymohammed@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909022227.620217-1-fahmymohammed@gmail.com>
References: <20260909014143.GA123333@bhelgaas>
 <20260909022227.620217-1-fahmymohammed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pciehp_configure_device() calls pci_hp_add_bridge() for each bridge on
the newly added slot without checking its return value.
pci_hp_add_bridge() already logs an error for one failure path (no
bus number available for the hot-added bridge), but returns silently
if the bridge's subordinate bus isn't created after scanning -- that
path goes completely unreported, and either way the caller currently
has no way to notice or react to the failure.

Log an error via the driver's existing ctrl_err() macro when
pci_hp_add_bridge() fails, identifying the device involved.

Signed-off-by: Fahmy Hassan <fahmymohammed@gmail.com>
---
 drivers/pci/hotplug/pciehp_pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/hotplug/pciehp_pci.c b/drivers/pci/hotplug/pciehp_pci.c
index 65e50bee1a8c..cbdfde557f3b 100644
--- a/drivers/pci/hotplug/pciehp_pci.c
+++ b/drivers/pci/hotplug/pciehp_pci.c
@@ -59,7 +59,8 @@ int pciehp_configure_device(struct controller *ctrl)
 	}
 
 	for_each_pci_bridge(dev, parent)
-		pci_hp_add_bridge(dev);
+		if (pci_hp_add_bridge(dev))
+			ctrl_err(ctrl, "pci_hp_add_bridge(%s) failed\n", pci_name(dev));
 
 	pci_assign_unassigned_bridge_resources(bridge);
 	pcie_bus_configure_settings(parent);
-- 
2.53.0

