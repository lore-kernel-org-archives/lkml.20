Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792755844;
	b=2gRyYhy8/zQAaTmu9nvwRU8NmYgxrXMwgfolciXa/yJ1CFadLq7XB3RcFFavch3gX8bR
	 Z6accmcXDXDF/N9fTzzVc3u9c05PEEc5tCWr2VluKarZIc5CE9705RfKbOW418KDL6w6D
	 VsUVUctOl/1zrC5FIRt8bEUw7FHmESJnZ3c2X6SVwH+NhJ3UJZfpFx9G0eWrnJEvPWH7G
	 /4eWQgntnRbJ6AQpzDEwILqbGJY1p149RB9l5bLBM8m8qQIaHcw3uqcDcQYKEMQ/zkSIv
	 qCfnYFczp5cxqJqL46Q8RSplsI0UEtx+XOKGPE+XtJGgUt34jyjEIgRTHBZijQySnmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792755844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:From:To:Cc:Subject:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=KU+/W9TuJAZs/zdQ+dGkcv2MjLFcFwFkevq0ou/8PiI=;
	b=j7vypbuQOpmGwCOri5joH/4cd6rHFclUMoTG2MZ3OzwyoEIGRXM6pjJGrYmlpPOSoPa+
	 rYkhwpHiShe/+mlGw0xkPLUiz1/1W/bPVZNkkdlcpFX3zj/x8VZsMJlHfjBkHwJ5I8DMf
	 3rD6uNUZ5a/rSudleCzKUa2V52nRtJNs+jxyhYgwO3eN80b6IYCTqnfCuUo/M+FG9j6Hu
	 UF4k1+TSH8borPE3HvmeejjBMZtj+d63ZCIF1E+UYoOsbbU77VTnjMIlu8Gd/Ag+e3WOD
	 Ucj8yGIPOIoc8Zen9we+kzH2xodrMJyg09egAaC0kgMhPdQki17A3BazV5CrbVgJMQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F3VqGISM;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB7B606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AB7B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F3VqGISM
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso5873745e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 04:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792755842; x=1793360642; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:subject:cc:to
         :from:date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KU+/W9TuJAZs/zdQ+dGkcv2MjLFcFwFkevq0ou/8PiI=;
        b=F3VqGISMgHXw+FctwncMmuJTUfbICz2ckCoFLJ/V15ulf2JMWhXnXJluCLiNbapH7G
         6ROpnKUDAjd5qqKVOyL7/yPd+A06kjgZlb0q0kJTtD/tQPmpJhIaJ1fNNjO2a23ysD5G
         uoU5sPN7ZNVtHlyPpVtryXJTFbqHrdDGYplcqBkA63u/hR/ugbLgkJQkXC8DJ6jyNMEv
         NADuGWe87JQ2DfOOckHtz0zwVASDanAJwlkaxYB6+dKpDVMa6Juy23g3Lcujvs3cYlUR
         ZdFjAWwsXe3I9IKAl5g8ihWq0lgArZL9YFkhxYB42JazKJYl1GWtAh5/KXtd82SKrPYG
         GOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792755842; x=1793360642;
        h=mime-version:content-transfer-encoding:content-type:subject:cc:to
         :from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KU+/W9TuJAZs/zdQ+dGkcv2MjLFcFwFkevq0ou/8PiI=;
        b=acGo/Fc9g/M/thL9LBY4TlsQN5rT1pqBtAz3FvkYoT/7aszaH5pNS55Kdx2xMxJijH
         z3wliGQigs5kb35XA4L01gtx+qQ09jqFVljpB47SD0w5OMDiPmi8QZwpauqu06N3ypcK
         v63xvpEJ1rb6kH0ASWdYhsmHQXxyodh347HhPBem0Z77mpQ+u+jEsE/ODY95uhsu3S2r
         MGtoxeG9XWr8UuzIuE3EKYNnkRzuxZuLxmmeZlVtGA6qUvKqTa85F77B/LsqqDOvns2r
         PWEJSzl29JLjO7fWDVh6rAYh7AU6BujJXNrGixzqcl2mEvjadAR3Jd/1hIN/XMWHSOY5
         pE8A==
X-Forwarded-Encrypted: i=1; AKwUvBwJkFm8wZLAugWQgN3REMu3RPDLhHHmPAtCaCj9GoFIOl+vJeVYyIVfcrK/kt9pxdvcoBFgmd67Z+9T2lE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXOIG0BNLD5sMwmq3aqFKc7vldtjDVfmpc5rHMhj4E5ekIrvOh
	kdEMGs7Nrqs7sea+hflqFJAxoG8X4AilwekSPFC7iN+uuhQhRF8rlPt4JALwASFFY7o=
X-Gm-Gg: AYBFou0KOK+UHvuYmNe4LAI+WRxyrV0f8hEl6YMESTTjs6exluFebFI0DSR7asewQBw
	KW9aoMBYqWPvnjMLG8fxvN+7jjNYAhqHmvuYCVssQ+kOPiaVROKy2zdZtUWaojUo4MdOuicKmEG
	klGaonMMdlLqNOaoz8i/xWGYR6FcoKlNJxqou81A61cyjzZR36Qom2uDTorc5z/Z40+4XBU/qFi
	paWj1Yp2TmGnedvYYPSX7vIVr7aTbwY7VZOvMfMjfMdSnCUMHCTYWPfRCNbFC1ALx6j4RATboq9
	KG/VLHi4F5/Qw57qvgTBeNAnfSazRzmZNDiOIud+2sl9s127E+vNoMDhCnL6ruWvit12TzHPnA/
	7nNBfxBuzuVReByPFUHpM8+Fe+6flgHPQ0cXfXGrpCo8GOFk7/sT2FITOaq1caVaVKcVgeQm/FV
	b8SuVJymHOHA03ENGq2DHHYS7hDhZ9Lz24FQqjkMWgW+1I52hb5WeVsYIvMMPAcpqUWxXz0dzdJ
	j/t6t/YcQ89a72TyD7A+vNouHWSNka7fo8cm3lVlXFzKovB3juTW5qqYjUa3M27fP5Gbdf9CQoq
	trnMA7EKBOvgMSZoo+t1QWsruKCprQ==
X-Received: by 2002:a05:600c:1909:b0:4a2:1398:dd05 with SMTP id 5b1f17b1804b1-4a21398df21mr29796735e9.16.1792755841745;
        Fri, 23 Oct 2026 04:44:01 -0700 (PDT)
Received: from SurHub.localdomain ([102.208.97.12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37edce44sm4742310f8f.3.2026.10.23.04.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:44:01 -0700 (PDT)
Message-ID: <6adb4881.dcf90272.1a940.5568@mx.google.com>
Date: Fri, 23 Oct 2026 04:44:01 -0700 (PDT)
From: Abdifatah Suruur <suruurism@gmail.com>
To: linux-fpga@vger.kernel.org
Cc: Dinh Nguyen <dinguyen@kernel.org>, Xu Yilun <yilun.xu@intel.com>,
 Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v2] fpga: dfl: afu: prevent read-only port mappings from
 becoming writable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

afu_mmap() rejects writable mappings of port regions without the WRITE
flag, but leaves VM_MAYWRITE set.  Userspace can map such a region
read-only and then upgrade the mapping to writable with mprotect(),
writing to FPGA port control/status registers the host owns.  A guest
assigned an AFU can use this to reconfigure or reset the port and
interfere with other tenants on the same FPGA.

Clear VM_MAYWRITE for regions without the WRITE flag, as i915 does for
its read-only objects and as fixed in drm/vc4 (CVE-2026-68445) and
drm/panthor (CVE-2024-53071) and ptp: vmclock (commit
a5edadbae57e2298a56cf7a4e774a027905a331f).

Fixes: 1a1527cf5dda ("fpga: dfl: add FPGA Accelerated Function Unit driver ba=
sic framework")
Cc: stable@vger.kernel.org
Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>

---
v2: use a 12-character commit id in the Fixes tag, as requested.

--- a/drivers/fpga/dfl-afu-main.c
+++ b/drivers/fpga/dfl-afu-main.c
@@ -836,7 +836,11 @@
 	if ((vma->vm_flags & VM_WRITE) &&
 	    !(region.flags & DFL_PORT_REGION_WRITE))
 		return -EPERM;

+	/* Prevent read-only port mappings from being upgraded with mprotect() */
+	if (!(region.flags & DFL_PORT_REGION_WRITE))
+		vm_flags_clear(vma, VM_MAYWRITE);
+
 	/* Support debug access to the mapping */
 	vma->vm_ops =3D &afu_vma_ops;

 	vma->vm_page_prot =3D pgprot_noncached(vma->vm_page_prot);
