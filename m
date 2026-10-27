Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793074880;
	b=OQsJrCrjKDsIl1qV2yibQbUp9lEicZRgKxZPYfZtmbuMbhVCtxd70i0gPsLbHc/frDZv
	 ZTAeI4PkoZcxTjNHu7y1jtTWscI2LBA0XHEmRiRMy13jkGh+ccgQuIl0lV9dLOxfl/+G2
	 PfVJxrju86LZWw09UPO5MieKX0XlFHItloCLWCA3NcGxrssEuElIoz6NwrrAkz/5ALVef
	 NqOTe6tY8/gt/7WRxt5lIEs2HqfUrHgcapj9tcCBtFtIcWV3UAwwM68XgBvkFynRg1Q/I
	 uFl/tjzjvPRlm+NaVuBflwknLDQOFaLlNiN2Lb9WX42dZzb4TiqFi2V81by+adE8RFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793074880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=IbKbkm2FCu1dJjWm0bA0zRZkrHajWkzVG1UGfJQ9bvA=;
	b=JQJYDVNDYwHPk8ojsTwb6Fjrg9oU83FStexCPqyI5K0qmXr4hGGYsjP0Fq07TOWJPRHm
	 KwcWcebAX+5o8FC/GgOKqaz699Ehy7RKj31YLTGXAZ+IHp/iSJDND2bktjwvut0uZVD+y
	 Sl5cZC3CIJfYwpdU9+/SN2MVESVhgVvJD9zkqkepfASSZN+8HyhsfuQlF6H0l8wdTXHoj
	 0Q2O/V6uITS3TKcChmC9wPDdezgcxMtpxMGaQpuNPXjwqtFU1jeyn9sAUd+LO5ObZp1TW
	 2tqj+w5n4NhnNyilVYA8mpMG+jtjXLGTh/T+/5QYgthNdHNY6qggwRVEgXWQ206VxVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="U+webZk/";
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5F5606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C5F5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=U+webZk/
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so1579615a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793074879; x=1793679679; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbKbkm2FCu1dJjWm0bA0zRZkrHajWkzVG1UGfJQ9bvA=;
        b=U+webZk/UC0AmEh8JfGeN0MsgqZ5s35ckHlqcQZGpqM5matT9IESNMyqgLlqhn8+LU
         62r6mR2RVpK4FKHh/WYKLLfw4IkyeBL78s9aMyPY/LBrc/ElrYJXV4FSqAoO8HPIUfve
         57DIfcFTgwcH9ibOsaVbpBayQsR7iIg7tLxZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793074879; x=1793679679;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IbKbkm2FCu1dJjWm0bA0zRZkrHajWkzVG1UGfJQ9bvA=;
        b=zby5fNOADImq97mEDlDWlLoWmMP5238yn5TfnPq1/U98TQ+UkxVWCexcmEidNzPky3
         Xs87Oo2JXIyZ+PPVIE+0QnbjGxfbtg1tL+AbVJX+xYAfxU2dag5iIqC9Xgk8nvuLkRbf
         wZ9QYtdnzznpY3Z5ed3meLx2Jx41WQDkkFlq9zbgPXM5VwdlOouP6BoNWwHmwZaxDY6F
         pgYmse1v5rNYmxr8xx38poZgPUs5EoHs9exQ5++rRuwjiuGSMIJrakyxagZZPRKRcJkD
         /uELWVL0uF6aQ+12kf6/ZoPmwlt8enz7OcXml7i08Yea4m5G13MaId6aQ20b8UAz1pvc
         FYlg==
X-Forwarded-Encrypted: i=1; AKwUvBzOC1aCCxWeH4thJOH3K+prQ37CgRJxhLLpIncs1goxI4cNmYv+l1476bydf7M5M6FX5XuN0h6qvCpI/Rg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoV3sselAqWWcCXrFNC+VBEliBQkriACw5Y6ULioOdOrGdldox
	Tbr25UL0LsPGH3SJQ//EwmC5vPnyABswwgefwi2tyblglTRd7uSEH79ampl6O+aB0Aw=
X-Gm-Gg: AYBFou044KP/hysfpFCkZKkamYEGj6kIQh22EACgOV2rZzzpaJQrC7t/JWZeIuRu0Fp
	lt6o6MkWDQMafqm58vKAKR5SXzNHQx4v3EzvcvS9ObvRLUIFFDVykF31umqEKFx/ORKwF2NHkbO
	SVCJfPF1lFIATFnVxW7Hly2qLubC/ROl6XXI8s+0K720fd8nPVBh4d3BKK+CLXLqffzGZ+9wWha
	VqBAwSELnUI3q/DbtoLjUPY+DhRK4Xe4hwBONe2vKweAAV5A5oIrwJu3II2CXUWxfloNNnmxIv7
	ZDXEkNdr7D4ukcZFziMxDSsA3DN2Oc9aj9sorr3IlXndb2/AixnqQTp3r5QveLDteLZDa9KN4cC
	WSKjWORfa1U0ZfxyaHu6EU3jx6tmHq+THoDVzWpzrc+DJxIpGp02cHt6cUXunTGQY0ySJQFYcId
	j3dkSeDQDHuIHRF55WLBKdXfj/xPgbt56BrgGpboNcC4RQZUdvOAfGYP3NgEH+jWUSN1v040Pcu
	TnjvTjLhprLSffb4djhOCs92W5lDo1IFg3NCEYx/xQfAjHhMdILGwhFJoO2VAPxDbh0B9mA958w
	3AqXT0pN3xtr9RlQ22ubgsQjAcnJcm7U0OL/XDhE7vdKAq2LAQf1ZjnPIg5/CveNDvCrLrmcOsG
	otfvaq6Z2CHMERoOODleZm5myNUCtA9P+u5qSzm3tFdvU
X-Received: by 2002:a17:90b:2d86:b0:3ac:17c:6e89 with SMTP id 98e67ed59e1d1-3adeae6d79amr6903972a91.19.1793074878569;
        Mon, 26 Oct 2026 21:21:18 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40427bf1sm1790327a91.6.2026.10.26.21.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 21:21:17 -0700 (PDT)
Date: Tue, 27 Oct 2026 12:21:14 +0800
From: Chris Down <chris@chrisdown.name>
To: Omar Sandoval <osandov@osandov.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-debuggers@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH] proc/kcore: Allow disabling /proc/kcore at boot
Message-ID: <auAmuqZyUodq3iqk@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

/proc/kcore lets any process with CAP_SYS_RAWIO read all of kernel
memory. That's a pretty large read primitive for anyone who obtains
CAP_SYS_RAWIO (and it also gives away the KASLR layout).

For this reason on some hosts we want to turn /proc/kcore off. However,
on a kernel built with CONFIG_PROC_KCORE=y the only ways to block it
today are lockdown=confidentiality (which also disables many other
things we perhaps don't want to disable), or LSM. That's annoying,
because on the majority of hosts we do want it on for things like
drgn/crash, so today we build two separate kernels.

Let's add a "kcore=" boot parameter so that this can be disabled at
boot.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 Documentation/admin-guide/kernel-parameters.txt |  6 ++++++
 fs/proc/kcore.c                                 | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e75344f4e0cd..d8acce2878ab 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2915,6 +2915,12 @@ Kernel parameters
 			parameter KASAN will print report only for the first
 			invalid access.
 
+	kcore=		[KNL,EARLY]
+			Enable or disable /proc/kcore on kernels built with
+			CONFIG_PROC_KCORE=y.
+			Format: <bool>
+			Default: on
+
 	keep_bootcon	[KNL,EARLY]
 			Do not unregister boot console at start. This is only
 			useful for debugging when something happens in the window
diff --git a/fs/proc/kcore.c b/fs/proc/kcore.c
index 390547b992ac..6a29a3e0ed92 100644
--- a/fs/proc/kcore.c
+++ b/fs/proc/kcore.c
@@ -69,6 +69,7 @@ static size_t kcore_notes_len;
 static size_t kcore_data_offset;
 DEFINE_STATIC_PERCPU_RWSEM(kclist_lock);
 static int kcore_need_update = 1;
+static bool kcore_enabled __initdata = true;
 
 /*
  * Returns > 0 for RAM pages, 0 for non-RAM pages, < 0 on error
@@ -720,8 +721,19 @@ static void __init add_modules_range(void)
 }
 #endif
 
+static int __init parse_kcore(char *str)
+{
+	return kstrtobool(str, &kcore_enabled);
+}
+early_param("kcore", parse_kcore);
+
 static int __init proc_kcore_init(void)
 {
+	if (!kcore_enabled) {
+		pr_info("/proc/kcore disabled on command line\n");
+		return 0;
+	}
+
 	proc_root_kcore = proc_create("kcore", S_IRUSR, NULL, &kcore_proc_ops);
 	if (!proc_root_kcore) {
 		pr_err("couldn't create /proc/kcore\n");

base-commit: 01146870c415f6ff70a469fb7ceb962a3f2c8c52
-- 
2.54.0

