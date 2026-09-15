Received: from mta0.migadu.com (out-231.mta0.migadu.com [91.218.175.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB34496D5C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789471210; cv=none; b=udjorucKHDblauHqLvVk50PkvH19d1ZfNwePra86O9/ivZd9kV6vxLbsKzw2G9TUQ3HA+lTXitxN+UsiiLAM3cEXHz3OKbJ7VRpL0yw7t4k6E7HUAHL9Ld+nRNJi7VaD6wssWs0Kml77MP7TuzXXVWZ9Rea25Kl78EZbExfhOak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789471210; c=relaxed/simple;
	bh=JtD89L1dx4UJ/DydTrhuEnA2LjRpfNnvhSqmPT7Ris0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Omr04x0+vGTay4ob45pmnpnQ/QJ/bG34O9eIQM+D2ZmJ6JiRbTVDMNk+1zZlnfsZfC6HXFNlTgkZRBPvehM3GWZdADQOHwFtlFwmTmptSNkGfui8Utw16A3koB7cA68hr94zJjjad8emwLDHa9oiqclvmDeSexR1eczYwOmLc8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ntRPFzZc; arc=none smtp.client-ip=91.218.175.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ntRPFzZc"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JtD89L1dx4UJ/DydTrhuEnA2LjRpfNnvhSqmPT7Ris0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789471204; v=1; x=1790076004;
 b=ntRPFzZcFmRo+T8f8ge3fiH0muG4l5uLHNsgBsvsq/H8ETvkLheXZAtyPYBAaiRuS67jE5ID
 5SaBp1e2sroTuyJcpwjynxj8QAGf8ynh6B9zlrTzdqYPtrl5PyJv1Uz4AAs5bc80da+Eazt5lD4
 CcuoyUq5yb0Hsyr6Ciw3aAuM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e6f6da4d7cec6bfb;
	Tue, 15 Sep 2026 11:20:03 +0000
X-Mizu-Trace-ID: e6f6da4d7cec6bfb
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b78e073980so4658e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:20:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwLe/1+P07dUi0ELnw4Yh/c2AuTikcCRLArBpZbKU0lsAP7yE7ZNVlWYaHbwFiM8bXUxSKOLLNCikShVI4=@vger.kernel.org
X-Gm-Message-State: AFuF++kT9WxZaS5S1hU2U3aTaVy5A2mBqdiaeHsmMnsBzg2LL+CvzCR6
	2WEzY1cUVFOa2GC5sDkzB+OQWDNgeOQuJ4QLrwtTdYuwnx0/QoBUw1pY7oKRAGPS4QENcSJJ4Rs
	WVM8JzW9mhzgilzsW61Pxz5FIQVNjcyLkBQC5ZOeg
X-Received: by 2002:a05:6512:3f01:b0:5b4:9dba:4ecd with SMTP id
 2adb3069b0e04-5b8b320b1e7mr115483e87.11.1789471202368; Tue, 15 Sep 2026
 04:20:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914113338.159227-1-fuad.tabba@linux.dev> <20260914113338.159227-13-fuad.tabba@linux.dev>
 <8633vc6jag.wl-maz@kernel.org> <CA+EHjTy6F9tG=eRLMuykc12P-Oc2pjMoQqAz34iGR+Q5GzV2jQ@mail.gmail.com>
 <86y0d26ale.wl-maz@kernel.org>
In-Reply-To: <86y0d26ale.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 15 Sep 2026 12:19:26 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzJzL420JOcFCnnPQAM1oFJ0dTKHxjBDr45CZasAxzhHw@mail.gmail.com>
X-Gm-Features: AcwNN1W6ZAFjFHfA3IpEcZtftsyHh3ZzGb-8lmwznnDmxio05774SB6E7nfAk7E
Message-ID: <CA+EHjTzJzL420JOcFCnnPQAM1oFJ0dTKHxjBDr45CZasAxzhHw@mail.gmail.com>
Subject: Re: [PATCH v3 12/18] KVM: arm64: Prevent host PC adjustments for
 protected vCPUs
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, steven.price@arm.com, vdonnefort@google.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sept 2026 at 12:02, Marc Zyngier <maz@kernel.org> wrote:
>
> On Mon, 14 Sep 2026 15:43:16 +0100,
> Fuad Tabba <fuad.tabba@linux.dev> wrote:
> >
> > > > +   hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
> > > > +   if (!hyp_vcpu || hyp_vcpu->host_vcpu != vcpu)
> > >
> > > Under which circumstances do we get hyp_vcpu->host_vcpu != vcpu?
> >
> > When EL2 calls __kvm_adjust_pc() on the hyp vCPU itself:
> > __kvm_vcpu_run() at guest entry and inject_sync64() in nvhe/sys_regs.c
> > both pass &hyp_vcpu->vcpu. There the vCPU passed is the one to adjust,
> > so it's returned as is.
>
> If this is the sole case, why not check for '&hyp_cpu->vcpu == vcpu'
> instead of this odd inequality?

That's the only case. The inequality is the same test as in
__get_host_hyp_vcpus(), but &hyp_vcpu->vcpu == vcpu is clearer here.
I'll change it if there's a v4, or feel free to fold it in if you're
applying v3 as is.

Cheers,
/fuad

>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
