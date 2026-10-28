Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793169333;
	b=bABx64ZX8qveaL7466tg4a7fXhEc67nJNIg9KhGWT+XbWW+TVlJzI+cs+SxuiflMaNkN
	 4iL26FRcZ6eyl5xDeVsnQqBrASDjtPjNTUG1J+0rdqKWRxSFpy4yfAvxbjXHEsXC0bSQC
	 O4Wa51X38dYIOVK208lfNetvmQnYLtBzHdQ2k5VCGBltybqqfJ04SwQCTG6h7DdiRlZ9W
	 XNDhU7JutYMIyQ9esS/7sbhTj54yLj52mzw/R1ypoykp0vG3TEPolV7RgsycCjZxU/SuW
	 ihQNy7/nUL0E3uN1EYc3rN9mlrDs0EULxk/ivXe10zAePYv9+9PyWI1GjjzdhcALlNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793169333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:From:To:Subject:Date:Cc:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=8h/qo6kthTAWj0+DvmbQM0qiT9gJIQfvau3oJd2x4lk=;
	b=VvEfKDvLgWoNZaVG/50jBXQz0Jc22Nsn/tvMTRRE1IxM4Nu6O0+HpCdwvmK4B6JU9wJU
	 895p7fDiBrafB6hQsiupx1d1WvCNSWLvX6kg8mj6iEy6ZvjReMipdM5aIwzXpkE3izDEn
	 O/YPCO5L5zbThZpXaDUTgW9lR0wezEhwsx24JBdxS9odeSjaWEWUwAoPt46tTEOfMSrGU
	 CJG/NCyRTgXLVb7Px60pm5m8DKJFcyXu1ZUyIjtQIXfO4YiAU74PLTtEnpbFICDb+hD4/
	 +dkFcGC4NMgUrLM9EPguIh7LpTJZ9c3D3kLtjSc5r1pXpSbYyodZxkvH8xjrc6/4RGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=utexas.edu;
	spf=pass smtp.mailfrom=utexas.edu;
	dkim=pass header.d=utexas.edu header.i=@utexas.edu header.a=rsa-sha256 header.s=google header.b=dJJpFxCE;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E6D606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2E6D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=utexas.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=utexas.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=utexas.edu header.i=@utexas.edu header.a=rsa-sha256 header.s=google header.b=dJJpFxCE
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-8479f46ecd8so306490a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=utexas.edu; s=google; t=1793169331; x=1793774131; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:cc:date:subject:to:from:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8h/qo6kthTAWj0+DvmbQM0qiT9gJIQfvau3oJd2x4lk=;
        b=dJJpFxCEQwE5J3Nif2uJcy7MY26ryGbOULpFGzuGbclxnagJO/NUbVD7zqpdFXlQzA
         8G7lstMzvNXleokI2IjHzTVRAHU92CHA3SMW6bNmDrHtv7lhjd2g53S1Y8jSrc9BqBfc
         3p8LrQW91NPwDzym6FRsP1vvrs+awWmkq4odJwzokOXgfeKV5MBqtzjHy9ja652OnhW9
         dak5W3tghp16s+DnDDeOpnEk6s4HaJEZmCPqx8QBPzYNS+INlliU72Lp8xvs+yjozK/0
         JUFSAhojxz2ey5Do1ZLb2KcXNJMF+3paFaa4zvXm1NnZgLO9pBo8tmuZxFSHRE/K0Rbl
         F9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793169331; x=1793774131;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:cc:date:subject:to:from:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8h/qo6kthTAWj0+DvmbQM0qiT9gJIQfvau3oJd2x4lk=;
        b=x4wDqAiD+cu+g/1HxI56CdVirAzs6EmTZibvbpzojnvsaFe2dJaCHzDQjOChHdwrFu
         EFguTmPVQ+N+LciIlADuTKZHbrgRadIFBeBNDmDFI4GUg5YM+SzurdN1zZVgbXbuLoAv
         esPDQ0tlSzUzMkHJQLMu+CykhUvwR+vuQeP6v7vcJ7qfK9s2MUhn3Z5HTJIpgg6ZoWPG
         MEF3sLvC80K6ZVoBTdgth8MBwaAWWtqGYL9O37VzxceM3GMzTfweV0PETJHuM0LmhJg6
         8r2U8cklZcwZiASlS00yNSUb9XWvxqHe2V5dBldjktJq/31+vdImUmPCDT5KRSLXZG0z
         F7qg==
X-Forwarded-Encrypted: i=1; AKwUvBy5YMcMDqHkeBIg2IeYWorFEZMwziD2l8ylw54nwKViHOjK1lJsN9PO11SQFH0KUUY7GLay2aca3TL8Ng0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1OPAw/QjQDvuUW0XByHFEfkM9nqAsowQw6jssTrH/GjsjbfK0
	JmTf/PblJkyQlqaOyWMEh9YeHiCXZAR/RH3PErd75FDAFR/qzqsvssu+CkwyKfEuy9vVT/q/9Rg
	Os3TtX53ayw==
X-Gm-Gg: AYBFou0CgdQqMFyb0VUwiQGcSxtOsnfgnAzKlLG/QAU5iXt4rU1xmBWmxFnzuiabp3S
	lGHKiM0GNqYwMuVYF4gdwFj1AzLqXO8TpucaMFGplaCimXr8ghqjhwukk4E7FTUTMGVo5kHsSgw
	NTty/Xsjdh1oUaz/SNoWcvGskYMD6y+w3Q5Weabvmjb+P7dskG4OK9MQOX3Iv2cL16HTGMRY00R
	0GX3J5v9kyRrEFuYQPC50aW0gGP/2cOOw/TJU2wUZ8yhLLxG1dd2Up+tiiuIsAfLplITzohl2JU
	W3MzXL2IL6dnGIFNwTpnZ6TFLsvmcfnSiP4kYIKCHyAp4pcLL3Ecu/sBkneAVnP+R1J6bj9gnhi
	MPq5vXx3yRzXgabzj1M4j9FGqK/8RjSJzNDXFZ/ZwsbhlHioXjpfCdqbzGQfzQDtM9+CYJnjicx
	9HIEOk0WrbQMDbKnExQqLNLWi3QYj84KmHo1ngQ4De7jtWpdwUMhTt6MEbvENhi/Y4J2502JJBu
	6svvigIzGcQdOIMJRQGZ2zG/VESQ74bx2ups1wUg3RJCDAHRp8nZ25z/KN2aRPJZFdhOCzmLAnI
	DKZp5jNtEj8zAMU+5q/eE/yZteGiNj86bpJ6fAfsUKLH1uGcvslJSyROYcdwDRkzcV5qcVmNdGI
	yapAdMRLtsrSD/QIguUE2sxGN7Bq4NUpzjar9LLoPnCqEvBUdyy7B6gC6wmr9K7iSwlgyhwdye7
	H84HNEAVZ+RSUi2d1K3/u6Li5+lIXYic4mFkEG2wc90utCzXInOb1QI6R52I9Ry1yJ0URA
X-Received: by 2002:a05:6830:44a3:b0:7dc:4947:36a1 with SMTP id 46e09a7af769-85ab9e46071mr1422426a34.12.1793169331496;
        Tue, 27 Oct 2026 23:35:31 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([173.174.112.101])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b1f4363d0sm770585a34.4.2026.10.27.23.35.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Oct 2026 23:35:31 -0700 (PDT)
Message-ID: <6ae197b3.d47bf0d2.14cb70.fecd@mx.google.com>
From: karim.sabar@utexas.edu
To: Matthew Brost <matthew.brost@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2] drm/xe: Rebind VMAs one at a time when a bulk rebind fails
Date: Wed, 28 Oct 2026 01:35:29 -0500
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <atl2i1vJoU2QwCbG@gsse-cloud1.jf.intel.com>
References: <atl2i1vJoU2QwCbG@gsse-cloud1.jf.intel.com>
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
these parts. On resume the first exec rebinds every VMA in one job and
xe_vma_ops_alloc() kmallocs one 384-byte op per VMA as a single array.
Final Fantasy VII Rebirth has about 33,500 VMAs which means a 12.9 MB
array. It's over the 4 MB KMALLOC_MAX_SIZE and can never succeed. A
bind that big can also fail later with -ENOBUFS when it doesn't fit in
the migrate layer's vm_update_sa.

When xe_vm_rebind() fails with -ENOMEM or -ENOBUFS, fall back to
xe_vm_rebind_iterative(). It rebinds each VMA on the rebind list in its
own job, the same thing Mesa does from userspace when a bind returns
-ENOBUFS. Each VMA comes off the list once its job is queued which
means a failure part way through leaves the rest for the next attempt.

I tested this on a OneXPlayer 3 (Panther Lake) running SteamOS's 7.2.7
kernel. A small Vulkan program fills a VM with 20,000 or 35,000 64 KiB
buffers, suspends with rtcwake and submits again after resume. Without
the fix the first exec after resume returns -ENOMEM over and over and
Mesa reports the device as lost. With the same fallback loaded into
xe_vm_validate_rebind() through a test module, the bulk rebind failed
with -ENOMEM on all four resumes and the fallback rebound 20,024 VMAs
three times and 35,027 VMAs once with no errors. The program kept
submitting after every resume and the kernel log stayed clean. The
patch itself is build tested on drm-xe-fixes with W=3D1.

I tracked this down and tested it on my own device. I used an AI
assistant to help with the debugging and with writing the fallback. I
ran every test and reviewed the change myself.

Fixes: 2e524668c440 ("drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops")
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: stable@vger.kernel.org # v6.11+
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Karim Sabar <karim.sabar@utexas.edu>
---
Hey Matt,

Sorry for the slow turnaround on this one. I said I'd write it and then
it sat for a week. Here's the iterative rebind you suggested. When
xe_vm_rebind() fails with -ENOMEM or -ENOBUFS, xe_vm_validate_rebind()
now falls back to rebinding one VMA per job.

I only hooked it into xe_vm_validate_rebind() like you said. The
preempt rebind worker for LR VMs still calls xe_vm_rebind() directly. I
left that alone since it's not the path I can reproduce but I'm happy to
add it there too if you want it covered.

Thanks for offering to take the error injection and IGT test on your
side. Also I'm not on the Intel CI allowlist which means CI won't run on
this one until someone hits retest. Would you mind kicking it off?

Changes in v2:
- Fall back to per-VMA rebinds in xe_vm_validate_rebind() instead of
  switching the op array to kvmalloc (Matt)
- Link to v1: https://lore.kernel.org/r/6ad8027c.7f7fe2b9.10c6e4.4073@mx.goog=
le.com

 drivers/gpu/drm/xe/xe_vm.c | 49 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 99e42bd29..3cbb305b8 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -370,6 +370,8 @@ static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, =
struct drm_exec *exec)
 	return 0;
 }
=20
+static int xe_vm_rebind_iterative(struct xe_vm *vm);
+
 /**
  * xe_vm_validate_rebind() - Validate buffer objects and rebind vmas
  * @vm: The vm for which we are rebinding.
@@ -397,6 +399,8 @@ int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_ex=
ec *exec,
 			return ret;
=20
 		ret =3D xe_vm_rebind(vm, false);
+		if (ret =3D=3D -ENOBUFS || ret =3D=3D -ENOMEM)
+			ret =3D xe_vm_rebind_iterative(vm);
 		if (ret)
 			return ret;
 	} while (!list_empty(&vm->gpuvm.evict.list));
@@ -856,6 +860,51 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 	return err;
 }
=20
+static int xe_vm_rebind_iterative(struct xe_vm *vm)
+{
+	struct dma_fence *fence;
+	struct xe_vma *vma, *next;
+	struct xe_vma_ops vops;
+	struct xe_vma_op *op, *next_op;
+	int err =3D 0, i;
+
+	lockdep_assert_held(&vm->lock);
+	xe_vm_assert_held(vm);
+
+	list_for_each_entry_safe(vma, next, &vm->rebind_list,
+				 combined_links.rebind) {
+		xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
+		for (i =3D 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
+			vops.pt_update_ops[i].wait_vm_bookkeep =3D true;
+
+		trace_xe_vma_rebind_exec(vma);
+
+		err =3D xe_vm_ops_add_rebind(&vops, vma, vma->tile_present);
+		if (!err)
+			err =3D xe_vma_ops_alloc(&vops, false);
+		if (!err) {
+			fence =3D ops_execute(vm, &vops);
+			if (IS_ERR(fence)) {
+				err =3D PTR_ERR(fence);
+			} else {
+				dma_fence_put(fence);
+				list_del_init(&vma->combined_links.rebind);
+			}
+		}
+
+		list_for_each_entry_safe(op, next_op, &vops.list, link) {
+			list_del(&op->link);
+			kfree(op);
+		}
+		xe_vma_ops_fini(&vops);
+
+		if (err)
+			break;
+	}
+
+	return err;
+}
+
 struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 til=
e_mask)
 {
 	struct dma_fence *fence =3D NULL;

base-commit: d2ce8fcd778ee6d92748c92d23a56d4416c29d86
