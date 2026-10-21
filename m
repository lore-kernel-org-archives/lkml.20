Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792541311;
	b=apgJoQjvKRqs9pGVgrW6LPJ7VD9aB/N3Kz6qam0l885vr5Qltpk3n8/h8Rf53E3Td7DA
	 qoEHNsqzMrFUpEdMWC14JXRcvrRLpsdL/iMz4uVrl+LQb/GAUBIHHFE7l9RLznOir/Rus
	 ZYS9uEeqRyzIuwoWpb6bXHBfdzCKuOiMAQ2q5A/yVQjRGwwvhu5aK86A5K4VIXSlCEkZA
	 7c3xaJNiPv0n11SXezbCmR3tm+sZxpl5R08vMu66vmB9s2m4Ylpb9Cj7i333yYbXnMpgg
	 CLAzViyFPeCE25b4r797q7/XbNtTqdFKc0HvQkJsaDGWbnzJPlN+4isA+Bv0cjtMPiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792541311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:From:To:Subject:Date:Cc:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=q76fPd6I+9oLgbQ4WW7J9EoxVAQOgPqIoUvr4JNR1bA=;
	b=eKRSUhUo8N2VonVnbwMab77uhVJhKn26NBkSnxPTM1bMBHJa8ZoBD8l6QxQxBkyZiucn
	 duGJ8uE/NFSpN3iD2AdWdjfZ9fOG/zQVJOmpIjljp33RvI+Vdy3MtpL4ZBV1UNH4XYslX
	 QnQYjYkhfu+3NPVaR3AmxgqLuyIWd+Eelm1nbUavzf/VN0vpiVNzI63bYk7TQBFY6IvHJ
	 SF3GNmEHAXXkctoOKWkc0QRB4uUpxxLd8qs9owkdfr7KFSohQcfINSsj+59H7k+98cdlq
	 o6iChTe3OpkuqBN42//41X4v3mLuAW1dSUq0PPNQ/XvSvkum4iN8dnEGPj86n6QfPnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=utexas.edu;
	spf=pass smtp.mailfrom=utexas.edu;
	dkim=pass header.d=utexas.edu header.i=@utexas.edu header.a=rsa-sha256 header.s=google header.b="il6YDP/4";
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DD7606A321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:08:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10DD7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=utexas.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=utexas.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=utexas.edu header.i=@utexas.edu header.a=rsa-sha256 header.s=google header.b=il6YDP/4
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-833e671ee9fso148133a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=utexas.edu; s=google; t=1792541309; x=1793146109; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:cc:date:subject
         :to:from:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q76fPd6I+9oLgbQ4WW7J9EoxVAQOgPqIoUvr4JNR1bA=;
        b=il6YDP/4MWTaE9oOQd29crSa0vn02P2eqibmeGX38ROUktudUqJdcUa95VncnY3tVB
         aOyJfnJETgKmVcdlTdlB9BZS7lyCuGws4QsAthBzdIOAwtzYbEpfUAzL+pnZ0g5QRh70
         b7YOIKlilcoeaAEevpULEfolsuQObT1IwmCIp1MYMvNg8KY6zaIWpp3K2zF2JFJU4rch
         glgy2kUenOxtK843TFra8hKMVm7g87U1B/x+7EzJd7CeMnh46pKMo/14EpaMjGU5IdkN
         i0EEFF7disU8PCdSgTZSv+YnrWca8T6XHvrNKiHHK6gHE6r3SA8c4lkbKtBHVcqysAdg
         3SeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792541309; x=1793146109;
        h=mime-version:content-transfer-encoding:content-type:cc:date:subject
         :to:from:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q76fPd6I+9oLgbQ4WW7J9EoxVAQOgPqIoUvr4JNR1bA=;
        b=AL5BnbScXN2Kt1C8XMvG4wePL7qIiNUCuRxxZu67eFlpT1iN3IwQbqVxQzlul5WX5N
         xyH30JsjFaKja/9jLYAlNQGKLTt67NVW3+ZLUH6geDjeZ3aXvDE4ia7SN228byu8kXMz
         p889a0QoYOStH2f8B3f6GQORnqz0Ely8D5JUVX5IOTuwvkENuORma7YgjFcBEM5nqB7z
         QA5nXqYDbdZxCDH3H4nPFB2LGYdDSXvSK5vdvJF0D3NHJ+mFriBbJh/vscnS4pgk+Ueb
         Ly3Q1eKQWP3RrBwS/TVI5nrnMEayOZQU8PRvKyVaayaq/T+MkIu87vll1QOz0MLxlLfe
         rmrg==
X-Forwarded-Encrypted: i=1; AKwUvByjMK/Jlt5qcu3ipUMEHF96IuvF8ZWbhofwLC+sR42frK/Ht/6nrM6wSLI5OHtuTutEFrmDyJcGxnq8aYE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoZEHTjaobHsw/NU8VWAq+RBnBITqDd0fYSxqXvtC9509ueDIx
	HxmSTztJ8R/MOtDuKtCOvzLIlappD4aBfzZ1skON8vvntoLrx95Yx5gLXxBxoBOONd4=
X-Gm-Gg: AYBFou2RWADqZlXg71/U3LNIYQTxpXQ97EE1wLdzIVIaB/lwMCp1IFDoSNNkB1Olj7F
	PN3L3hNTe2MQjFNKLnHZKF8/0l3/jol8vQKoGdxVxRa5zchaqlgP6F1HkUVMcEG/3OHP9txgaNr
	+INGMlBjNqcianC9rEk5RBlKTD3Jmsynq7+RLQ/F0U5DSpKpMwT4bCYMTQoZ/N79eZq9Ab6mURf
	o8C2igdOtVcAVDPjqkJjAG1RyRedEQYss3WpR6STRJ4LTqkOYfjcn9aXNV8Qxvh5lR6I3TMfKb9
	eetnFUgT0cWPlErwUrf1nQ0oxbHy3d0IOzPnwyheP0I9zZwun/Hq+p5zi5lUG2HHy6Ee1IbRuSU
	4ESaufo02BEn+5OVyh3uv/kxsu1Uf0wO0GAknI+zqjySF92Kp8gZ9Y7NRxJcyHYeXTr8AVTphUg
	2AHZD6+lBDDiF0lFzDyI+JMUZwfhWvL17XOVfzFULljQh2U9VaVSt4uZnRaRUMUZoKv5b0FrEYJ
	HAeQx8WZ/8tnKm4wTkQ80FX0GPFQhbb3uw3RTnW9T5DGXUEqqYUUiPJ4MONwDrzjuWU14gpxBBY
	0b9QcWbjP+OK3kB1rWA2TjJfs7ciaum/6KGC4hFiAtYPbmWxmCGoWpM/B2P3Nyxtm6u+Hq3OJA2
	HQYJkh0qvy3+FM552MMiz+Uk71yhevlw4SxduXkNFTHTwKY41uHsyY0uERaSt2mXDcCQpjQzvdc
	YQAnAy43wc0JMtoKBO1A==
X-Received: by 2002:a05:6830:4425:b0:81c:37e2:2012 with SMTP id 46e09a7af769-84d07f09896mr256325a34.15.1792541308869;
        Tue, 20 Oct 2026 17:08:28 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([173.174.112.101])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84cbd7d4431sm955195a34.19.2026.10.20.17.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 17:08:28 -0700 (PDT)
Message-ID: <6ad8027c.7f7fe2b9.10c6e4.4073@mx.google.com>
From: karim.sabar@utexas.edu
To: Matthew Brost <matthew.brost@intel.com>,
 Thomas =?utf-8?q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH] drm/xe: Use kvmalloc for the VMA ops page-table update array
Date: Tue, 20 Oct 2026 19:08:27 -0500
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Karim Sabar <karim.sabar@utexas.edu>
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

From: Karim Sabar <karim.sabar@utexas.edu>

Big games die after every s2idle resume on flat-CCS iGPUs. The exec
ioctl keeps returning -ENOMEM even with 11-16 GB of RAM free.

On suspend xe_bo_evict_all_user() evicts every user BO in XE_PL_TT on
these parts. On resume the first exec rebinds every VMA in one go and
xe_vma_ops_alloc() kmallocs one 384-byte op per VMA as a single array.
Final Fantasy VII Rebirth has about 33,500 VMAs which means a 12.9 MB
array. It's over the 4 MB KMALLOC_MAX_SIZE and can never succeed.
__GFP_NOWARN keeps it out of dmesg.

Data from a Panther Lake handheld (SteamOS kernel 7.2.7), kretprobes
after resume:
  xe_vma_ops_alloc  -ENOMEM on 63 of 63 attempts
  xe_vm_rebind      -ENOMEM on 63 of 63 attempts
  BO validate, TTM populate, PT prepare  never failed

The array is only used by the CPU and doesn't need to be contiguous.
This switches it to kvmalloc and kvfree.

With the same change applied as a module on that kernel, the game
survives every sleep I tried with zero ENOMEM. The biggest array was
30,753 ops (11.8 MB).

drm-xe-next already does this through commit 0e33330f1238 ("drm/xe: Add
struct xe_pt_job_ops"), but that's part of a big series that won't go
to stable.

I tracked this down and tested it on my own device. I used an AI
assistant to help with the debugging, i.e the kprobe tracing and
reading through the xe code. I ran every test, picked the fix and
reviewed the change myself.

What I couldn't do: this is build-tested on drm-xe-fixes but only
run-tested on the SteamOS 7.2.7 kernel through an equivalent module,
not on a mainline kernel.

Fixes: 2e524668c440 ("drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops")
Cc: stable@vger.kernel.org # v6.11+
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Karim Sabar <karim.sabar@utexas.edu>
---
Downstream SteamOS report with the same data: https://github.com/ValveSoftwar=
e/SteamOS/issues/2962
---
 drivers/gpu/drm/xe/xe_vm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 99e42bd29..5caef443b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -703,9 +703,9 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool=
 array_of_binds)
 			continue;
=20
 		vops->pt_update_ops[i].ops =3D
-			kmalloc_objs(*vops->pt_update_ops[i].ops,
-				     vops->pt_update_ops[i].num_ops,
-				     GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
+			kvmalloc_objs(*vops->pt_update_ops[i].ops,
+				      vops->pt_update_ops[i].num_ops,
+				      GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
 		if (!vops->pt_update_ops[i].ops)
 			return array_of_binds ? -ENOBUFS : -ENOMEM;
 	}
@@ -742,7 +742,7 @@ static void xe_vma_ops_fini(struct xe_vma_ops *vops)
 	xe_vma_svm_prefetch_ops_fini(vops);
=20
 	for (i =3D 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
-		kfree(vops->pt_update_ops[i].ops);
+		kvfree(vops->pt_update_ops[i].ops);
 }
=20
 static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_m=
ask, int inc_val)

---
base-commit: d2ce8fcd778ee6d92748c92d23a56d4416c29d86
change-id: 20261020-xe-kvmalloc-vma-ops-2637ebf81cfd

Best regards,
-- =20
Karim Sabar <karim.sabar@utexas.edu>

