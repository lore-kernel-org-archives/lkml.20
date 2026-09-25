Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE404AF142
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350495; cv=pass; b=cCQJc6fTuRu2XcenDFdcrxS9tdTIWvk4W9fN9Okz/Qu6skFwxYY3gR+tKX7O2oNH9kFlie6f3LK1peSO/KkmhV4VT8rIbFOpCBZnmX2n75ucpirnk8auG+Fzl0+9tCZ9qAfENd+Rv1VYx4Ut83qOaPgmv1xpwU6PbrXQklLpwb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350495; c=relaxed/simple;
	bh=c4skHotUrohj5tY649YiUgljNI4R9MsOmUhNsuTt4mw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O+1bGGQhlWI3b+CdB1JumuopcNyvzpswmbXijTtUx2/wRsRvZnZzm9bcuGMCZI59DIgGSz5BkL0/wOwLl0QtUUfG+0lt/KVO/ZYaRxRQ2tjDpjgy/jCv1wFqvhNftSGWKI7sfRhr0+uV+oi/kJZSQd+sMOBrUfbrghdshr3VNL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O1MyTIQn; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O1MyTIQn"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8e6ec4e0bso731154e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:34:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790350490; cv=none;
        d=google.com; s=arc-20260327;
        b=AgyuzGkP+UJ7qy5s3wP7EunjEofOWrAXm0Sr2LNibVDiSeqguHwb1JgImBZYGM6Phu
         LlgD1o2cE0Z05yHOflVmZDMQ0ZiRRUZR3cbuHZDHmeKpC6QN/KyBtyihNZa1RzFtmf1V
         AkSeZ32tdahaqnYTjpXEy6N+3XLqrimn9pJjXIw8CMAeTTcxqJbu6LU4iKDBxkDRpZ4Y
         5Vj+ZxTXxXVK1lQ6uX8bN8wz698rs2ja/eV0wWDGhgKRJZ0Ro3nrVM4JCLH8NNYyHt+4
         B/crPItqW5OZboSZNPfcchBtOXHp16UKkXAD2w6HRCP2ePsm8I5IS/wu6sgjdi31HjHG
         JTlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LvgREEEhLtnlSAa2TqV+iSmo5cysotPSfNcR8BHubB4=;
        fh=yhK3+W7/u7+KnuGhgsu8W4zPicFAuxBQw/HXl1BPnyg=;
        b=FlgVs9A8eZgRQHVqECYq8U8ljR4gFk2ydBZkKOX5fmxly985fSobld5Rldh1lKu0PN
         5mtVUJsX0kX+q3E3NU86fVqwnbVRlpWWWB9Ex6r5C6yP/QHIF5lIzyeyZ1plgzomVFDu
         dcSkwzBuisDLDStnfaEswSwLgRu+3G1sTR0hGUiJ9pgLuik/EyEQSCiEPm3bOcjIdX+C
         VcsMMOvlE/5kQ2dzA0zKdZb2KF5JB3h/Ey5UtwrUxvtHYs8HA5zDmqcptTAl1AAgAlQ7
         9mFvNiIDZfl7bfVyjrRuwSORPfCd1WI6FnkmhMZnoO2C9+lgoV9EbgJlpq61+uEGxSTI
         3+kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790350490; x=1790955290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LvgREEEhLtnlSAa2TqV+iSmo5cysotPSfNcR8BHubB4=;
        b=O1MyTIQnzOyM27E9q6b9rXtmkvc+s0IFHz1fOicCZf9QMnCGE0SuUbofcAyMnnZPqf
         mwQr06NaG0OIitVLmOfFTgD8QE3Ull+234CKemM0td5PZIaUa9rv7Mf/aaMT3j9mLLmD
         hgmY5jcPFosd+WNio7fBSi/DESSYRkiM8d1W94Jca9GEqljNQqn+D3fxr91B2r6jQ2ip
         wZliHo9q+DUW5Md7c2SXIQOOJOf2eudtLlkoqy9g9OPuwHgZM5BiI7qHpC/RO9UoT+me
         SlBvs6OdgHK7Ylck7eBNye6uy1wXfcFgcYQFHCyP2afH/UltMNwHYmhaJy8QIki7mM8X
         NGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350490; x=1790955290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LvgREEEhLtnlSAa2TqV+iSmo5cysotPSfNcR8BHubB4=;
        b=jiN3vchyODqN+bBUv7HVEEwR1oGz/9Sq5IZs2mfeJpSRCUyTTrDvU1apKhQq3YebjY
         hkI8eMM71GS18DrAtDH+M+GkrWxyKjWD2oaU2J9Ui97UL2+o3UbVfdE3TEdGpMMQGmV7
         SpFb3JQJcmsT8GsJkWjO/l4JN0Q8QisLh65FYKwtegHDJoc3sZjOpqoGmypbNGsYJiZd
         Ju3UDzOaTZVCTL4/sBsaOxSGUyYxtdGgoD7dkjWJcoXdqPV1PoRfpRzzGBMekcGVrbJc
         TGEVgloNVOVOsa6L79jhub88w2xD7Jbf2VCNnRJ0VIaaJ9h7Nmy6S+N5d2qoA9CXPwQO
         TaGw==
X-Forwarded-Encrypted: i=1; AKwUvBx2/fl8xlbsU091UiKOJqvxkqPaXCuf4Em0/I7PX8LVy1XHnYBFX2hFTuJ4/J4RMrTTgqXS4hUW+01ekFA=@vger.kernel.org
X-Gm-Message-State: AFuF++mUZ6/EnhSlhUlkOz3Gol3K5G3yVJXGnlHUmRDHlICPwmdctG6t
	6TT2r5jIu7Bu6kaNHz0HXRPM6VQEVYu2ohFuDIe6ljv9AwoF31lCTnf5vUMWXBdk9k4f0/4Q0a1
	w1vVRYufWgalQoG6Bo+8GT9f+7PYVW3uWdLavrhMi
X-Gm-Gg: AYBFou3kH+K59S8IZ8IRNwpEuri1+LNaT7FFgns/Jy8cFXJcVPkoLzv+40ZAYhe5uwF
	yjZgURKS0hwsOzUFlmP7yG1nLnrSNo4csdMovPSLinooq7ah8T+t6SymMOlOMEbe4RJWAs3aOKv
	xk/GVgzX8sccMfYDkHs8I6hUvtNU/PTSgfF2bXZ4rUPCcPLDHKCQlV7S5DKPsC75cfpumE/W1Dq
	jgxUxcMHhALRK000DWkQuRSPy2QpuA4trG3Vl2su/wyAj1hj+cYgLLShmglrOyMz4H5QT9Csp1X
	qUYFPWaiSFb47rT+Sc+NaT5tZcZw1FU5k5qeTZwwrJ1yMZYw1H28eQ==
X-Received: by 2002:a05:6512:118c:b0:5b7:5142:d495 with SMTP id
 2adb3069b0e04-5b8df085af7mr1904494e87.64.1790350489353; Fri, 25 Sep 2026
 08:34:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-6-suzuki.poulose@arm.com> <arZmXFw5Jw2IbAmA@arm.com> <a11aba04-eaaa-43fd-988b-a2581b1b2fdb@arm.com>
In-Reply-To: <a11aba04-eaaa-43fd-988b-a2581b1b2fdb@arm.com>
From: Alper Gun <alpergun@google.com>
Date: Fri, 25 Sep 2026 08:34:37 -0700
X-Gm-Features: AclHuK8ZdVRdb_V4naZFOsXJSH2Fz3e3v_5J12YbiSGiHDcQI7elXhO9Nk5iNy0
Message-ID: <CABpDEu=Dmo6+KpkYwRwYyCWtKjazJvTktVQh6d+2sUM3AchHbg@mail.gmail.com>
Subject: Re: [PATCH v19 5/7] firmware: arm_rmm: Activate the RMM
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	maz@kernel.org, will@kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com, 
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com, 
	sdonthineni@nvidia.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 8:02=E2=80=AFAM Suzuki K Poulose <suzuki.poulose@ar=
m.com> wrote:
[...]
> Kdump may be a bit more easier, as the kdump kernel is supposed to use
> the "reserved" region and vmcore access could handle the GPF and
> provide "0"s to the reader ? May be this is one case where the
> host needs to be able to handle GPFs.

I've tested kdump on CCA hardware with a running Realm VM and hit
GPF 0x28 in copy_oldmem_page() when reading pages delegated for
RMM/Realm metadata.
Since do_gpf() already runs fixup_exception(), using
copy_from_kernel_nofault() and falling back to iov_iter_zero() in
copy_oldmem_page() fixes it.

Here is the fix I've tested for the v16 CCA series.


diff --git a/arch/arm64/kernel/crash_dump.c b/arch/arm64/kernel/crash_dump.=
c
index 670e4ce81822..b0ab22293aa9 100644
--- a/arch/arm64/kernel/crash_dump.c
+++ b/arch/arm64/kernel/crash_dump.c
@@ -6,16 +6,28 @@
  * Author: AKASHI Takahiro <takahiro.akashi@linaro.org>
  */

+#include <linux/cpufeature.h>
 #include <linux/crash_dump.h>
 #include <linux/errno.h>
+#include <linux/gfp.h>
 #include <linux/io.h>
+#include <linux/uaccess.h>
 #include <linux/uio.h>
 #include <asm/memory.h>

+static bool system_has_rme(void)
+{
+ u64 pfr0 =3D read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1);
+
+ return cpuid_feature_extract_unsigned_field(pfr0,
+    ID_AA64PFR0_EL1_RME_SHIFT);
+}
+
 ssize_t copy_oldmem_page(struct iov_iter *iter, unsigned long pfn,
  size_t csize, unsigned long offset)
 {
  void *vaddr;
+ void *buf;

  if (!csize)
  return 0;
@@ -24,8 +36,31 @@ ssize_t copy_oldmem_page(struct iov_iter *iter,
unsigned long pfn,
  if (!vaddr)
  return -ENOMEM;

- csize =3D copy_to_iter(vaddr + offset, csize, iter);
+ if (!system_has_rme()) {
+ csize =3D copy_to_iter(vaddr + offset, csize, iter);
+ memunmap(vaddr);
+ return csize;
+ }
+
+ buf =3D (void *)__get_free_page(GFP_KERNEL);
+ if (!buf) {
+ memunmap(vaddr);
+ return -ENOMEM;
+ }
+
+ /*
+ * Pages delegated to the Realm Management Monitor (RMM) or Root
+ * world trigger a synchronous Granule Protection Fault (GPF) when
+ * read from the Non-Secure crash kernel. Use copy_from_kernel_nofault()
+ * so the exception table catches the GPF and fall back to zero-filling
+ * the inaccessible granule.
+ */
+ if (copy_from_kernel_nofault(buf, vaddr + offset, csize))
+ csize =3D iov_iter_zero(csize, iter);
+ else
+ csize =3D copy_to_iter(buf, csize, iter);

+ free_page((unsigned long)buf);
  memunmap(vaddr);

  return csize;
