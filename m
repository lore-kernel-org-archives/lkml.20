Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB95318EE7
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 05:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790400925; cv=none; b=c7MxLQhg/pFDT84bP7FLJ5NqHXoh+viQPu/HnOU70+M/e5sQf+3taWeJifoK3vzI8u29X3cAc6McYPR62rCmgAR8k6HPrVtjUG7xra2MNvWGO6RZE3I5XAe9P6U75NnsZWTijOWJtnRECvOs4Qr2qa7ptVunimMzj8bOVE9Wra0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790400925; c=relaxed/simple;
	bh=J6Prvg+6vaewHBeT2b1h/LdSJwG0urcGl1JQlFweaoY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oe3iRMfPCrnXLxq15BGylWBMaloqWG2g3xM67kBl8tNm0pFlgd92GtQw8FllJ65+CZtPMsTXoXeux/kdDETSf4ARVyF5H3kliavVjt4mf8aWfAnOpm2JuCzi0N9Bh7zWoAiUZZrHCGW2CMCn/DRvSl8syCTufMSCFS/3NTo0rAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dw6SmMx/; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dw6SmMx/"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3411e0ace58so1904794eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 22:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790400923; x=1791005723; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EVNin9yaHMh2i8wnCnC2c+dtKTQhoPPNqR7Ci+QQIb4=;
        b=Dw6SmMx/QKg/1/kxWtElvq9bBoZX4+GNqOvnCpc/2elcd9s8j3UsxNxrxJH34kNEbC
         iRsr1+MX8X0V4nzXxfvndOS7JI0AS2H43Wfki+UCR783h+D4wgi30P5vW9Pwv+e/WU02
         OgnJvcKuIk2N82BnGRIwSFb7N2rPzCCt5+6Qrm8dAbi7cZoUnrsbtjEqSpbgdAPBZcHe
         wgHT3paPQGidL4N+UQfwHhK4IKR3/xz2Imizoz/mzzMdHUq0R51wI8GH2vP931BoOwIe
         mZ0mJEteQ6/1VBC9gARUsxd3kIU9IpTyCjU781S8ECFzjlI2wWDU22uVWm+X3pkK5YZn
         2sPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790400923; x=1791005723;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EVNin9yaHMh2i8wnCnC2c+dtKTQhoPPNqR7Ci+QQIb4=;
        b=l228pkjx6EEw0uWX+bzzXbRNiumMqSbS5oXdZem85vv1vaLD3hoEs1z+x8sizX2Fp4
         vDvB320244RUxpbkicgR5lhuzYL6qLx8fOFJV+eJL32ThjyNPvugP6wQ0M0Q40SkXXe8
         4s7MchwFrLON0qKGvMCCUSZXbhDvZgnTcdxeDUtkLG+Pts8t71xYjJuKh0akmAhp02jD
         YvRwpA1sJ3CnNLiyEonlarU+kgAz8s6Vz+OOMR9wYq+NFUfp6et3WebzR1T/6bL/uqRL
         yrbZmkc8FWv8mcK6AeCrd27K9eiMo3VObvPpphRbVWhIrUZw9CYp8xeNj4BA8PBNYocr
         j2ag==
X-Forwarded-Encrypted: i=1; AKwUvBxNjv7QmMXKEMspNmIys47p3C4vIxBEd2eRcaseFVit+03UITQzJob/Ly1yMYAzlcvEMMrza6nM+3TlJjo=@vger.kernel.org
X-Gm-Message-State: AFuF++nEPvSAQYIgS9B9vV3QpZ5w0rqMqoBNRYe/Z3s0NtamjZvoODfR
	SXA7yIdvD5nNk/LdIbIznFK+mtKDNSr/MqoQhiShwtDEVn+YK+wMNvdn
X-Gm-Gg: AYBFou0EQmIJmSgNGzWBEyCO6rQR4ihklYY+U9bGruWNx12zbAHMj+/uvb302I/9KqB
	dsNfg++96FWzHBexMWgzznwaSYn1n0jOrixYWy5Aat973Y0vx0sl1p33DMnAayD1DYdtFGAbwLj
	D+CyNRMjGlTXcVcASo6yFfl5JFplEziyL0XgVDfcIaIULylsbGWnsh15z+su3YiO0wyNzjpwSKu
	XtZeTXr6VysnSYQu7EiRZSreJVZq4nabUbbBUTvMsoidMlIWSt8xH84Flakk2GbFke57gaeCtTE
	jnKst/RWlgCKheK5Y0e3qQQEiuakBklcUjKXaOPRBzbLvRSibUeJc2weB2yFVg9yDJrXC0TMpQi
	TUhMOuB5pTtryVPau4VIV71AMqiEXwY4eXtn62XIyL9OlTAKmBIGIJX+c1sPdlv9LAv0lu+W5jm
	eO5iQtnM6YMxcjJupjL/sYnxWSQZ91zBmQdLJU4hc84QnlpGBWUk96x5DGGaZ1ILRhOzgHOyBBl
	hsdid2Ae0jmm0vcdQ+tLQNFbYaZ5Hyu4mT/iqk=
X-Received: by 2002:a05:7301:428b:b0:33e:3f5b:3ffe with SMTP id 5a478bee46e88-34272a4579emr2026486eec.27.1790400923325;
        Fri, 25 Sep 2026 22:35:23 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:375:19cf:5fee:be32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145727589sm10629611eec.23.2026.09.25.22.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 22:35:22 -0700 (PDT)
Date: Fri, 25 Sep 2026 22:35:19 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Yazen Ghannam <yazen.ghannam@amd.com>, Borislav Petkov <bp@alien8.de>, 
	Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] EDAC/amd64: Stop allocating ECC settings separately
Message-ID: <ardZinoPZXbXZvhe@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

There is no reason to allocate and manage ECC settings separately when
struct ecc_settings can be embedded directly into the driver-private
struct amd64_pvt.

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Changes in v2:
- Return -ENOMEM directly on allocation failure in probe_one_instance()
  and amd64_edac_init() instead of using error labels (Yazen Ghannam)
- Keep the blank line after clearing pci_ctl_dev in amd64_edac_exit()
  (Yazen Ghannam)
- Make the comment above struct ecc_settings a single-line comment
  (Yazen Ghannam)
- Link to v1: https://lore.kernel.org/r/arCC5ukNvN11l1aj@google.com

 drivers/edac/amd64_edac.c | 42 +++++----------------------------------
 drivers/edac/amd64_edac.h | 25 ++++++++++++-----------
 2 files changed, 18 insertions(+), 49 deletions(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 475235c402e8..6b9d7bb11d76 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -30,9 +30,6 @@ static inline u32 get_umc_reg(struct amd64_pvt *pvt, u32 reg)
 	return 0;
 }
 
-/* Per-node stuff */
-static struct ecc_settings **ecc_stngs;
-
 /* Device for the PCI component */
 static struct device *pci_ctl_dev;
 
@@ -3999,19 +3996,11 @@ static int probe_one_instance(unsigned int nid)
 {
 	struct pci_dev *F3 = node_to_amd_nb(nid)->misc;
 	struct amd64_pvt *pvt = NULL;
-	struct ecc_settings *s;
 	int ret;
 
-	ret = -ENOMEM;
-	s = kzalloc_obj(struct ecc_settings);
-	if (!s)
-		goto err_out;
-
-	ecc_stngs[nid] = s;
-
 	pvt = kzalloc_obj(struct amd64_pvt);
 	if (!pvt)
-		goto err_settings;
+		return -ENOMEM;
 
 	pvt->mc_node_id	= nid;
 	pvt->F3 = F3;
@@ -4042,7 +4031,7 @@ static int probe_one_instance(unsigned int nid)
 		} else
 			amd64_warn("Forcing ECC on!\n");
 
-		if (!enable_ecc_error_reporting(s, nid, F3))
+		if (!enable_ecc_error_reporting(&pvt->ecc, nid, F3))
 			goto err_enable;
 	}
 
@@ -4051,7 +4040,7 @@ static int probe_one_instance(unsigned int nid)
 		amd64_err("Error probing instance: %d\n", nid);
 
 		if (boot_cpu_data.x86 < 0x17)
-			restore_ecc_error_reporting(s, nid, F3);
+			restore_ecc_error_reporting(&pvt->ecc, nid, F3);
 
 		goto err_enable;
 	}
@@ -4067,18 +4056,12 @@ static int probe_one_instance(unsigned int nid)
 	hw_info_put(pvt);
 	kfree(pvt);
 
-err_settings:
-	kfree(s);
-	ecc_stngs[nid] = NULL;
-
-err_out:
 	return ret;
 }
 
 static void remove_one_instance(unsigned int nid)
 {
 	struct pci_dev *F3 = node_to_amd_nb(nid)->misc;
-	struct ecc_settings *s = ecc_stngs[nid];
 	struct mem_ctl_info *mci;
 	struct amd64_pvt *pvt;
 
@@ -4089,10 +4072,7 @@ static void remove_one_instance(unsigned int nid)
 
 	pvt = mci->pvt_info;
 
-	restore_ecc_error_reporting(s, nid, F3);
-
-	kfree(ecc_stngs[nid]);
-	ecc_stngs[nid] = NULL;
+	restore_ecc_error_reporting(&pvt->ecc, nid, F3);
 
 	/* Free the EDAC CORE resources */
 	mci->pvt_info = NULL;
@@ -4148,14 +4128,9 @@ static int __init amd64_edac_init(void)
 
 	opstate_init();
 
-	err = -ENOMEM;
-	ecc_stngs = kzalloc_objs(ecc_stngs[0], amd_nb_num());
-	if (!ecc_stngs)
-		goto err_free;
-
 	msrs = msrs_alloc();
 	if (!msrs)
-		goto err_free;
+		return -ENOMEM;
 
 	for (i = 0; i < amd_nb_num(); i++) {
 		err = probe_one_instance(i);
@@ -4195,10 +4170,6 @@ static int __init amd64_edac_init(void)
 	msrs_free(msrs);
 	msrs = NULL;
 
-err_free:
-	kfree(ecc_stngs);
-	ecc_stngs = NULL;
-
 	return err;
 }
 
@@ -4218,9 +4189,6 @@ static void __exit amd64_edac_exit(void)
 	for (i = 0; i < amd_nb_num(); i++)
 		remove_one_instance(i);
 
-	kfree(ecc_stngs);
-	ecc_stngs = NULL;
-
 	pci_ctl_dev = NULL;
 
 	msrs_free(msrs);
diff --git a/drivers/edac/amd64_edac.h b/drivers/edac/amd64_edac.h
index 1757c1b99fc8..2c6b0429916e 100644
--- a/drivers/edac/amd64_edac.h
+++ b/drivers/edac/amd64_edac.h
@@ -322,6 +322,17 @@ struct amd64_family_flags {
 	      __reserved	: 63;
 };
 
+/* per-node ECC settings descriptor */
+struct ecc_settings {
+	u32 old_nbctl;
+	bool nbctl_valid;
+
+	struct flags {
+		unsigned long nb_mce_enable:1;
+		unsigned long nb_ecc_prev:1;
+	} flags;
+};
+
 struct amd64_pvt {
 	struct low_ops *ops;
 
@@ -372,6 +383,8 @@ struct amd64_pvt {
 	/* place to store error injection parameters prior to issue */
 	struct error_injection injection;
 
+	struct ecc_settings ecc;
+
 	/*
 	 * cache the dram_type
 	 *
@@ -441,18 +454,6 @@ static inline u8 dct_sel_interleave_addr(struct amd64_pvt *pvt)
 
 	return	((pvt)->dct_sel_lo >> 6) & 0x3;
 }
-/*
- * per-node ECC settings descriptor
- */
-struct ecc_settings {
-	u32 old_nbctl;
-	bool nbctl_valid;
-
-	struct flags {
-		unsigned long nb_mce_enable:1;
-		unsigned long nb_ecc_prev:1;
-	} flags;
-};
 
 /*
  * Each of the PCI Device IDs types have their own set of hardware accessor
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


-- 
Dmitry
