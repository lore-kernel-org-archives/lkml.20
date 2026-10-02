Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9214D7D58
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790951862; cv=pass; b=TGX/SNChD8nGyM2YOPtMxKHh6rzniNC6qGDs7DcspQzg5/+5AIj4xQ0THVRE7HbMVHLfomO5iFwFCmJNo/YjFBlyUq6ZTJz1gcaDn9bAniHf4aNlCE68C63ic+zOuc4hGaRloKO40QIcCJSiIZNaTLN0Z1SETkyUkDnEKLDURc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790951862; c=relaxed/simple;
	bh=bvtdEPxwSQXjnHdQcA79svDgXzwZQykpi2V56CMH9Ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bwR5HXqfjaEpwYykbbvMNAgyDGEHYj2dhXi/IiYT8pMz/npJ31K47AvLPEcyJ5/xuTlsISXGqOaxyQggzQIaxNcCAjLVsudofRib4a4+BZR0AMpp2BpJTOJ+JYkKVSWd1qscffvlCx29W7kqFP8UFw+i/kieCwxjuJYMPpMhkBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o/24jV5t; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o/24jV5t"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so6653e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:37:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790951857; cv=none;
        d=google.com; s=arc-20260327;
        b=Im3NvedjMRtNprYwlLFwd7NWFG6vvL9brM9rGUPbZm0vDWou229czCIvZJ6B1UBrcq
         1FL73ByxVpBF+Dce1PnCAekC1kJ1PeMi3rseuzmsYgOU7I/YVkYJ+36G6KxLiyjF5xhu
         mFVWry/tXRZI5g96+z2SLrd8bDxrRhuJFUBLirt5USmJkf/90wJP2L0h2I9x4hQU+31g
         RUxYiDh4XTV5biyFYIXAJ3V9kkkz4lNEDt/IkmLRPyfDTV9fa2PSeeBhc+QT6GBTqIbc
         bta98MKyotFubeM1YNL9Nlw9ZprrMq0I2yJt7b9uTPwn4BZKFhMNmxiokeNPFioHnepk
         XhOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ngc+Dc6mG5eMUNtbuXMSrmBLpP8pJzc9TOtXps7kTTo=;
        fh=f1HznqLU/vMDt1y0T11PcHBreE1xcGZtkmCOEasxj+s=;
        b=qSNCtafEcE01L0Q4No+YVZnIbmpQAI496eptWH0PAGVLSifKBvayDy0X/dYnYRY11g
         3BMqMJx/rimTzrYF2mOg+XByUnbRdJi00G3Mv72usSAl3Jf65orN6OynY8zsfT5Gt7TH
         jTqEsxyjy+0QQolJ1XMvRZVRe/JkkteCZXvns/H0r7O9f5TxbuMzzOFsZ5YS5qMwCCIq
         pVITbDizsu2VGe2NQ30q5HVl/cLhvp+TuQ3PMtarK4Xgp8KHkdOPbCiaCcbORkH+j5wW
         xNBQsEX94v4ZBlPFBh0Tmg0+wPrFQA2JM8MRDM1OQ/jRTQG1TFwnFKWThIFT3WkHB7lo
         x34w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790951857; x=1791556657; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngc+Dc6mG5eMUNtbuXMSrmBLpP8pJzc9TOtXps7kTTo=;
        b=o/24jV5t79Bm2Zt+VQM5tDH6jq5vNUw++e662O4aqTtYvWtbG9A+zp8L7S0pu0Kyw4
         LNV8ITbxzYdKk76PNKIslnPJasWrvu9tny78dsR3IbsBqqL3Rn16uEIz1E0aQXnnORPY
         PKMKJoYVjh9rpyT4OjotPp4obAmJCd3aB1r6DH2RtCOsUJeDlFq+msvKv4RTTTBzMkKy
         n0yTpCHc+1eCqQ7zgM1EwINd64FyI+oVlRo/M5EdLUHYafvZo+NpBod9iR4I/F22+QjQ
         2RHofRLWhnBupkIXZQGgNTiMzplagMUmUKRfzvAP/benHduQCGJDD/iZh1TSfVfPL9Ko
         PDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790951857; x=1791556657;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ngc+Dc6mG5eMUNtbuXMSrmBLpP8pJzc9TOtXps7kTTo=;
        b=I5UqO4AOzYQEGiqKmnlmFRERPEynGSGd9m/wRsoKmFw+5KNQWSZAypbKzC/VipTtUK
         RILjvrXdVbChs2DRbIOOGLPXgph+6T4xWjnCCyrJ191YW9ZrQT2sSRPxDPVO5nFtfva8
         RAZuGiqMmiZrhx5M4Yw4utXMWDilrUxgHjcN//+YpCRcoFErgwr48oV33ZUh+J2jJNb+
         4EwM4VwvbDUzaCc/EHLYZTCBw8bzFJgf5SNTY2JcU4bP+U0jyfan+J44PlKOfegb6PbY
         XaMB9NAibOsDN7uqErO3wA/TOksJSCL1DBJAj/Quwi8TYWLU01FV6wAuCW8sjJZnITz+
         RmYg==
X-Forwarded-Encrypted: i=1; AKwUvBx7RPDKzHJCPOzNiOsJwwJ5x1Xd92ONTQZYqaEFHna/6XkpT3keP46qgjMHvLWSdVmy8/u3iiAvyXjsOrM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwKzPYz6nXG5WfecFQrHFgDTEiHQl3ismyrrEtBziiRVMFqJou
	hKPMt7GTI8xLy4d8U5oGg+B/kinRa/HVvjkc51pXgchZ4liaE4KkcgVHCEkzHtKpDTVEm+2j7i9
	GYzRfCSUyWOmKsUd6yMt/jkzAOMJUxKRFuU8/G1De
X-Gm-Gg: AYBFou2ZKOH8j0PPxuSARnHpPBOc9JIfYlOaGfu+gau5N2D3XQ38BqMlFqG9Z0wicLh
	ErL9rQT/vOQr3Q6sCU1jCGUYGzvv53FNAoklBRSiFjpjSRAEtfDRATnfKqmXXereYJyM8s5NkTu
	tHxkD35oT6ZkChvA5WxIAZjI1wGQPi7HOO1zklddjLhSJ1hkIeL6TiMIUMhQYI15u4bE7DC9xEr
	4jxLi2zKk6BVs468/McvX4KpLnm9/7W8Kj3ql61YXekyJeCyZxgTrxlg0xLEHts+FYrSRvENmmX
	AnhFT8OQ7yooiNNHjr0BrEqidDzl1wqvEJMtVJ1VfmOSU98aETLLj2pDBZ1H2JndbohH75mhd1z
	RQ5rq3dff/0Cplw==
X-Received: by 2002:a05:6512:3da9:b0:5ae:cf5f:4a88 with SMTP id
 2adb3069b0e04-5bbe07ff87fmr127412e87.8.1790951856416; Fri, 02 Oct 2026
 07:37:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001210703.1597150-1-suzuki.poulose@arm.com>
 <20261001210703.1597150-6-suzuki.poulose@arm.com> <CA+EHjTxtatPyGcyvEyR129cqUiAYcO_cxRVtwZO0ckZsOnD7TA@mail.gmail.com>
 <86se2o2rbs.wl-maz@kernel.org> <CA+EHjTwHuJ0u_TTP46zNFKFmBP124XHHLUVhkAUSyfhe92=41w@mail.gmail.com>
 <86pkxs2npx.wl-maz@kernel.org>
In-Reply-To: <86pkxs2npx.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 2 Oct 2026 15:37:00 +0100
X-Gm-Features: AclHuK_ts2oonb5gFFEThD7Rzb_QZk1ok5N5MoHVdkKoZ33EulrV9BUtxD17tPM
Message-ID: <CA+EHjTy4rb+6z0bqh7sPqACES0EDpURdeoyiFGmdw3p0PENcOQ@mail.gmail.com>
Subject: Re: [PATCH v21 05/23] KVM: arm64: Track the type of VM in kvm_arch
To: Marc Zyngier <maz@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Fri, 02 Oct 2026 15:15:06 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> Honestly, we introduce the flavor stuff to make it easy to match
> things on a particular VM type in a readable way. So why isn't this
> reading:
>
>         if (vcpu->kvm->arch.vm_flavor != VM_PROTECTED_PKVM)
>                 return;

I know this is a sketch, but just in case: that's inverted. The sync
only applies to non-protected pKVM VMs (EL2 ignores it for protected
ones), so it would be != VM_PKVM.

Otherwise, looks good to me.

Cheers,
/fuad
