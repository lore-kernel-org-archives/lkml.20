Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421534B0E30
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789583043; cv=pass; b=mBEDkasV2woduDbiY0ybKiOIMA9u4HAEkJU+2rzO1V6sOREiqoB5noRCPpN4OueJNoKOK6fIn+n8jruL9oPo8tvAdMGNUPN1NRk7JYHE9WloNAaA1MEUV1/zo67BMzhfIhvWFlA/rQQTQ6IbvrBPAXgtv8x3XmHke4FZJKPMERA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789583043; c=relaxed/simple;
	bh=K1VkZN9Ax/ivqRQhY6l3VgzDLSp6+7t77YixSnLTILA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sTppL+apcTXhCj0b5BAGfu783NPUpxuffP/DTUS05K6H1RgDx3NWEReeOs2jTb/7dh65k+rwfX38fmN1oHGpJdl5eSmbq2VW/ZDLrUIZKoOlSbqFq+o1nRtpreDoxOMT8JK1Y9aC+2c0nbuFkcFRCyt4KArd1Qfv/WPIMuAT5fM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TOWvHVmH; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TOWvHVmH"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b74d0133e0so1213683e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:23:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789583011; cv=none;
        d=google.com; s=arc-20260327;
        b=L6rfXNYiktlRZ6d3j8NSiv9j3QW+6RLxOHPwy/NnSsFSZyo7CFHK9KNriezsv3RMW3
         zJyUh/veNi1tNjfR02R0/J2l5ZEYfIpMXT0TOCATyNCFY6kvjITWtCb9hr8CPh06I7fc
         97yI47lvh1/SlmwGJQ73iLbVQEwUxLFq7ZQBj1Fdq+CPaLKkN0T4IrRScLek6EAiHQ5D
         WrW/+a4bOSuISxoRFtTdeLhE7X0u9F/LBd+8CS43N2mNtJXs3MovlmsT+08a9/npj8H7
         h5Zcyx5xJekbJ4bTAY9abnjVKvsxJLQCPOzNKjEE6H76tjigNzyZXN+mPE6VDt5/5lAM
         eAtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iA6WOY7U5Hpnzgqa3cIbAuP1d1sT3cNwxEh5sU4xF5Y=;
        fh=Gb6unmStKk06NOkN+mJS3LnsKc05TPfdUK2ifDRPnr4=;
        b=Dego/w5QtlU7rIjsq4lMCblN7sfsH0LLYfHGP/b+ql0OmZu4vkct5CzV8VUgqzlDpV
         CwS66WaFseoCLBXODWGXgkrShwZLF864aRbUa7YpJ3j6g7wUhU7FR4quopUa5+kYOeOq
         dr2xlQfQPguNMCErubltDNekNkL241cxiw+eMnfI5y5B2csgAOT6aeUfQUAlfRLPnZUW
         Y1nXqGCtOoe8M1OpmOsBBDdVImGbCbWxQ32qFcg6pe2RsgaxQdYPEs4ON7EvxoC5vFdw
         1w37+FMGBeACZ/JmTst8JOEBDYikJmjqOofLLFUsY38wD8c7Jqs1p30YjzgX294bpG0P
         fYDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789583011; x=1790187811; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iA6WOY7U5Hpnzgqa3cIbAuP1d1sT3cNwxEh5sU4xF5Y=;
        b=TOWvHVmHt+weCIsIpXWwEjsqy28ZKumadJvtsv3OcYPUJwCRtgl8HskPfEXVpHE4L4
         FuaN1he+VTngVx0oarqnwK1kXYWtY5WlmjIzQE6gzNhbzrJ8/ETfqSz3uJunzJ062g2B
         s8CIU6mX161xEoWXmqdyx0/uytT9WN+XBImm76C+JZTtlWBCdu279L8HxEL9Dz32nfcb
         jRm7pPRpw4VGbMqiu5K4WmLlQcrhHDZ28tC7fNMsDjo8pVSMX1kkMK8T9U9ClyoDdV4k
         RcV48HfXU9I4ELPqR1UyyWGCpEReoR7jDPYkD+BzELs5B9vIDP3bERTLyjjOk227sLYL
         JJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789583011; x=1790187811;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iA6WOY7U5Hpnzgqa3cIbAuP1d1sT3cNwxEh5sU4xF5Y=;
        b=CHi4+BAcegWAi5aJhobLd6DGfatXDJvhO7RHXuIRJRAB+7gidYSyZ6F/1DfmO65Nmp
         /xqz/e7ChMHVINLVSz0LD7MlidVQ0oAoYtywrIVh2K74cR+QZHYPyed+ZoTM1iaLR8St
         bH1kv5A4dAwRjA+IHTvRc2KvObG7WI6prouMURB3Fc881OicE472yUqXqRXHf9eHDj1E
         7hVOBDGMwDZUU60auD35rrYzoDj+fYgnUETk+GzNOJcSAhSa/nlBcuZjQoLoEXpHj5CT
         qPxZkUb10qfOvDG1oG5EvL2v4Q7XMvSvbBDlPe777pPskBvmrbBn66yDU8lmepeA3FHP
         gjJg==
X-Forwarded-Encrypted: i=1; AKwUvBwPy/z10miJXHtgDfcYhSCqNYo5dWaxc8w5jnuZIOF/czP8GZxynZbtN8ATVVuTbM3KcPZLmR3WIfg6+Gw=@vger.kernel.org
X-Gm-Message-State: AFuF++nDUkxnx0dY61cBTQhNL9byVyo9HkUAJZKKUJGIUFveEMExOffF
	QVJeqkIBMLPa+G5mp7viXAs/GP0KFSdlWeLCAoNRNRK9MaNSPY2bhtPf79YMXVFkivnpDB3RH4d
	JG3S7i0h6rPuGZv2wpR/jNHBKtSo+KEgGEE4aZ/TM
X-Gm-Gg: AYBFou0D0HX1ZLG6OvGWSHWYM39hwTU4s1LQD8QweTh/xevc5yS8ZXjv2K+bN7yzffF
	qROCVibh1S7HrYU0w8hHYh+UGoziwzvTJg8qj8uEEYa+KDwJ/a08fnuyMhk5w0tuKsDOuZEUZHJ
	aykL+F1bdQ/+vC0enLvm/oGAzRkSQ7SCQ35nrHhtudj2X6/bksQbp73QkG6wuMSJp8l2vZbTldC
	MLMbSmb0DPjF/LXjf82Ug+bCMwRueQ2j+OGOLnHpHVEf+t13jwp95RHDomfFf1xLyJAfQKqCUuW
	fIaiQf7t1KjkHCUFsY/FejmNArbZCVDtg+1b6ITacRKXObyN23RZSA==
X-Received: by 2002:a05:6512:1293:b0:5b6:1a7c:aa13 with SMTP id
 2adb3069b0e04-5b8b6640be1mr1009695e87.43.1789583011057; Wed, 16 Sep 2026
 11:23:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912083611.2513845-1-suzuki.poulose@arm.com> <20260912083611.2513845-7-suzuki.poulose@arm.com>
In-Reply-To: <20260912083611.2513845-7-suzuki.poulose@arm.com>
From: Alper Gun <alpergun@google.com>
Date: Wed, 16 Sep 2026 11:23:19 -0700
X-Gm-Features: AcwNN1Xa9rZlSKbZ1HJXqNvz676wwtG0Dzc3HxbzhCyZpg8GXZHTQsxrOGLMh6o
Message-ID: <CABpDEum16ZzLSjd7Yg2Ge6VjwL8S8xxtSs_AsqOeNT9-9FNKKQ@mail.gmail.com>
Subject: Re: [PATCH v18 6/7] firmware: arm_rmm: Ensure the RMM has GPT entries
 for memory
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com, 
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com, 
	sdonthineni@nvidia.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 1:37=E2=80=AFAM Suzuki K Poulose <suzuki.poulose@ar=
m.com> wrote:
[...]
> +static int rmi_init_metadata(void)
> +{
> +       phys_addr_t start, end;
> +       struct memblock_region *r;
> +
> +       for_each_mem_region(r) {
> +               int ret;
> +
> +               /* Firmware-reserved NOMAP regions are not usable system =
RAM */
> +               if (memblock_is_nomap(r))
> +                       continue;
> +
> +               start =3D memblock_region_memory_base_pfn(r) << PAGE_SHIF=
T;
> +               end =3D memblock_region_memory_end_pfn(r) << PAGE_SHIFT;
> +
> +               ret =3D rmi_prepare_memory(start, end);
> +               if (ret)
> +                       return ret;
> +       }

Hi Suzuki,

What happens if a system has memory regions in memblock that are not
tracked by RMM (e.g. CXL memory)?

Currently, rmi_verify_memory_tracking() returns -ENODEV for untracked
regions, causing rmi_init_metadata() to abort and disable CCA
system-wide.

Shouldn't rmi_init_metadata() skip untracked regions (continue) with a
warning/info log instead of aborting? That would allow Realm support
for conventional DRAM while leaving untracked memory for the host.

Thanks,
Alper
