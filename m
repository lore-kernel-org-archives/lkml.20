Received: from mail-vk1-f227.google.com (mail-vk1-f227.google.com [209.85.221.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ADD58B6CF
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 18:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890876; cv=none; b=Ei67huafrhsvEuKa0FzbEgJqg0NwDvLijN7fIlo6drxnfohJgC1hvdYsloXvuReylDUoBiMPVPqOYGyFl4k5ueBuJ0bWVaeyx9mvA5ZYJOXPoRukK8Tatf0hqS3LImYl4hw9gBTJwhyj1tvcJm9j4fHt8J+ePn/AXVUR5GdjjJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890876; c=relaxed/simple;
	bh=3/G5xnGKNtyLpIWmfEvLNiG/KTtcFKselUmUIESFwoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bZ6UhAx4mywixaEzQMqwcDJdqPhkTHqvUFIvGf0OFKBKmjsDGEiy3ZnP9PGYHI5FJMY0voAUqP/kCy/5hnCFXxm3cfy6ZxToTCgUdyzyLx1n1hPxd42go+MnxJYs8kcloLffQOcCOCQt0TVQMWfyNsYLf8azbD+PhaUZ9e/f9ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LPhhRCyR; arc=none smtp.client-ip=209.85.221.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LPhhRCyR"
Received: by mail-vk1-f227.google.com with SMTP id 71dfb90a1353d-5c6559620e3so2159368e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788890863; x=1789495663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rb9I7ysehn3T8EdRE3wvUpvmDJ0lCancFwS1A6o0B9Y=;
        b=GdZ6XT0F+feW5I4IOyBTyoC8BeVCfx0lzjEvLSVeYpveMb73Rr1T9Kg+P9Ig9iB3b0
         wWwzhJSuHsPQnNPBaZYUH6BbW7Z1/sstuSa2Ba38RS3x+rVDslsqeG8uAcRknmTc90yX
         WEkgfEiJCMNtRwx1r8cR2IYZf2QI/Pat3RBPPCiiZ35Id/jsNU/45GhgJ3REgEXD57F4
         YJs/MoYbOglmFHMaXutSgTQuYcTU7/fZ4HgXWeyO5ZYOhpoXJfYiNsXcETXIPIX6lsC0
         w61YCnMIntGEhg6UbKHDyYXCPhZRtMYDnDG0lyX8tYOQKRskQLA7jTzQXahJ1J7Eg96b
         jwoA==
X-Forwarded-Encrypted: i=1; AKwUvBx5Cs5ztOslsw0MNouWfXmQX++Ky/ijV9mbagWawPwl8AlMpIcqXNgiPTrGcm0weg28rPCmQvpNvgKSbxk=@vger.kernel.org
X-Gm-Message-State: AFuF++mToTT6vivi038kt2M9Q2gc1DX97XDFttCqgWyKJRuETbynmy3z
	6J9QQIxiBeXxaGdZtNLJYeTPtjKKLG14rc7gBGvhvA2tNcvngI4+ilBcX6kQH5Tj9mCwAFPOHAz
	5tnsdjh0nsJRjv721doMUcWmeFROvUnHxckjwxy0yxwtS5/JUqsB/P9ypqiEol7KOcqA0rvuCXh
	W3/ohy8m4H6aNuOquRS8AHbn9iEF1yTmELq2RNumca2zkHjy8G1dikl3BOB7pd9BM2el7VVS14R
	1Z+BRX2eMrT+Ik9
X-Gm-Gg: AYBFou0mvqDgD7Mx+5+8wf2zZ8TiZrsvK3ryEhAaYRZUfpPp1QG8e4twxahouHb9VfZ
	Iuu9+vfRuynJOmoH4SQmrpS2vNBH5N2u1CQd4g/lkEt4zkZYKNICAOL9XtbvHCqptaVtkhoTsx/
	p6iZ6ewZ+CBZerFvMHe1AmtPGyJ+Isn0RsYgixKyBPj8kq8DyDlfZJnEpIrFM8B1bpRPUHtTCyc
	gMdfxU+ETDbBRABGqC7rwrU9ac3FsVbcoMK1T6RNv5MA74Mnu1hJJ/zv6k/u5+8UzbL/S5VMD2i
	bfMGwT0ABd9/zxvkM+KMFPuLHuXwtag9RYkgMj4oYeNdJWp7LG/9bYAMbF3+fDeKYGhPPwqn+iY
	Z2l+hkLWiBKQneA5gEw/BkzvSIJygiVRtH6uH+UiUuE7pbKNPaoP+nm6VTqlpXkO4N2QZFc961z
	sXzuUsD3vl66JwUqvJkFvqOmY1jYK9rTSb
X-Received: by 2002:a05:6122:340a:b0:5bf:6bf4:b215 with SMTP id 71dfb90a1353d-5c7ed29e8bamr15431767e0c.2.1788890862906;
        Tue, 08 Sep 2026 11:07:42 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c7ecb9e4c9sm6635027e0c.4.2026.09.08.11.07.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2026 11:07:42 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66faff68c0bso604858d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788890862; x=1789495662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rb9I7ysehn3T8EdRE3wvUpvmDJ0lCancFwS1A6o0B9Y=;
        b=LPhhRCyRZyuzTQcBAmo2drGqrP28HOzZNxyvGkLAtbfADh+IdFghaBVWH9WHuyXWI1
         MesUe/3riC8kgFxmKyEKViA837nnijXTOe181u6gaKfb/8It25zsWu6u6rH+U82FmI/V
         15bDhw/q9LrVwyPKymxR1qlByGuS3WS9Q+cuk=
X-Forwarded-Encrypted: i=1; AKwUvBw7SIOSx4ievoeJeF9JGpIHgMhT7psxNXylXaFoZ84i1ouXhuNzhEee1lrgtJAtulKQUU/pitJAa5pNnt8=@vger.kernel.org
X-Received: by 2002:a05:690e:1b44:b0:66f:9e32:fe1 with SMTP id 956f58d0204a3-66fb5921a72mr6969448d50.10.1788890861932;
        Tue, 08 Sep 2026 11:07:41 -0700 (PDT)
X-Received: by 2002:a05:690e:1b44:b0:66f:9e32:fe1 with SMTP id 956f58d0204a3-66fb5921a72mr6969419d50.10.1788890861415;
        Tue, 08 Sep 2026 11:07:41 -0700 (PDT)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9106412e038sm27114866d6.20.2026.09.08.11.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:07:38 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org,
	Petr Mladek <pmladek@suse.com>,
	Joel Granados <joel.granados@kernel.org>,
	Baoquan He <baoquan.he@linux.dev>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v1 4/4] x86/vmware: Run panic diagnostics before kdump by default
Date: Tue,  8 Sep 2026 14:07:16 -0400
Message-ID: <7487011dfb95aadda9515b22a5852680df1982c5.1788414671.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788414671.git.zack.rusin@broadcom.com>
References: <cover.1788414671.git.zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The core panic path enters a loaded crash kernel before running kmsg
dumpers, so the VMware logger cannot preserve the panic in the host log.
Set crash_kexec_post_notifiers during VMware platform setup. setup_arch()
runs before ordinary core parameters are parsed, so an explicit
crash_kexec_post_notifiers=0 still overrides this default. The 0644
parameter also remains writable at runtime.

VMware exposes no capability bit for this behavior, so the default changes
for every VMware guest. Running the logger first adds work to the panic
path and can reduce kdump reliability.

A full log transfer uses 1027 low-bandwidth hypercalls; three checkpoint
attempts are bounded at 3077. In vmcall tests, a maximum-size transfer
took at most 7.47 ms; three complete transfers comprising 3081 calls took
at most 21.58 ms.

The crash report remains suppressed while a crash kernel is loaded because
the host may terminate the VM inside that call. A future report from the
crash kernel or kdump userspace can restore the event after saving the
vmcore.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 arch/x86/kernel/cpu/vmware.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index c21fc835537f..d88c625d8389 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -646,6 +646,7 @@ static void __init vmware_platform_setup(void)
 {
 	u32 eax, ebx, ecx;
 	u64 lpj, tsc_khz;
+	crash_kexec_post_notifiers = true;
 
 	eax = vmware_hypercall3(VMWARE_CMD_GETHZ, UINT_MAX, &ebx, &ecx);
 
-- 
2.53.0

