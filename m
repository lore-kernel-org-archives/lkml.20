Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C604A1DE9
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 19:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894376; cv=pass; b=K25jRqG39xxKs0oxQr0Xrp3GuZdM+sBA2aYxdzJifmPXpSBSLIfrbaKW7PqdB9t/dw8f10olR6ot7o88FWrF3UNQ+2wC6EjtdELYdbiReiKtfZSWcEkUwkC6kBIbPZsL8SfC+cJHjLrNgl1lLifzb9suowTr/CzRff+2Hj0/IQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894376; c=relaxed/simple;
	bh=JxAv9A35o8tRcwxKjZO94SBS9xDo9RgjGVk4mfstMJQ=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m082W5D3cqktyPubtPvZXQyzrqFkCD18Xq3I81wL0EM0i6G4oaweN0uCzg+9/orXNV6e2verZPDcqLfaTB7+QJhgapi+Qj1F+Q2umwn2IvckJB3lc47EL7O8ySzZtnuncgNh/zGUSVteWhwzjPBVaIRsJpO19UvKouG1CCMmwGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oC67sJca; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oC67sJca"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66fa10f35caso4567558d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 12:06:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788894374; cv=none;
        d=google.com; s=arc-20260327;
        b=CXi1538y2RECslDdyLs6ZhlmrExzPL27/C83xbvVP3qX84qTxHkgzKZYkHfkbjTBZJ
         8yI9p2MyR++4//cSGBuFpJGYpIDeXrhfQ5HQB+4+J3JHeaQKnl1WWw7gbRL/xshLeaX3
         SUXhXat1pyiLMHEwKs/uNeq0a52S1wAVkJLefSGnhhNsB3/mqwd2j2GjdNAE7S5Ca+Tx
         6VIlT9Oub0iJuE6FTMBaz/imJzhrjZFEuJIH+pCIGmiJ0MYy9Arvqi2K/7aEmkY7pvq8
         SW7YkxoCkwKXXbEl/NFMCr8ltH9YkKo4N2dqJRM02p4dL3wJliGMgnSBqgD/Rn7P8oXn
         9HUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=hhSMn73HXnZUeqqhpj5wjt1oII0fZ8bLb8+fuULddR0=;
        fh=Dg9iUveyuM1CLptmcsnTUpCRCecspGwpY8o1VrF2hgU=;
        b=M5CnYSfSRC9AKuMm4zanGIevNV08JgbKgqJ1YeNGLyjohDXRqd3j12vPkd9DyAWOhA
         f1bNvkg2UNj8VPw4Y/zr6gdWcYrLB03//UDSf2D89UxrTlldfqmK+AvKYqO9MJzrdR3L
         uJA5GrYr1+2Ym7QnstW50hVwccdNorotxB6WpoimKVF3SA3/U8+APFpWDVbTzBHdM1oj
         OcB3KllfD0xVMyIaxdBdU61PbBHXPMTNdhx9z/OcZ54t33jYkeMvGfhhnmGkmFUIwi94
         uvqyV9hGKKsDiO/5kW7oDr4GwRLiSytL7td/cvY5gqaxjcBpS9jzW/rWPymYqJvIv3ZZ
         SMrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788894374; x=1789499174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hhSMn73HXnZUeqqhpj5wjt1oII0fZ8bLb8+fuULddR0=;
        b=oC67sJcaorDh1kjqjpVLuyalUhep2NkbBs6C69vF3ZQ737maXmCGNC9HR3wVUUAu+p
         IAPvdYi/hi9bOlyBUQWZuPxCac8/CSOfLY9V0PgProfNxs7AkRsoF/xQT1d7G1xlMbdq
         Va/ZeX03But8KMlDOphJyp+FtdcpWSI/61ioT5egU/rUM2n8wo1p/BPvkMicwzBTXcrl
         JOSAK3NFI/Mk3LQppqpEbN20vNgVLOk+xkmMx3+tOY3y4S64Cl2Uh7ZjiH1RT8yIRH8z
         XJgWT6NsQmdCVTkpjN1EdoCGffm0mte2KnEI61rF2cVh4AhUIIxfRGylQ+5hYMKyTbnH
         yb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788894374; x=1789499174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhSMn73HXnZUeqqhpj5wjt1oII0fZ8bLb8+fuULddR0=;
        b=ATz68RYg/zGg9D4S3/OBQLrGymrqHhigrtTOL030WCuAEGpP1JKiq5fJ9drftnJ4k3
         1pJxqIwgBPvn/ef6ziBP0V4HlalyOJq0BGvlscsaWVe4cwC3MQXgeyfq/8f4uBCOoqcs
         UxUqT4Qmq7FrEiROGqcCns+Jd9XYCianO/82p+S67Fqnokw2fXpDqUVtb3t+LLD3Xn5x
         XvcJjENQTsyj+c0ekmkyMqTCK6QoJtVhhuSNJLJesBcUvJHPYtWDW6e6n8iY6ZGtLEDP
         ZnQOc/qSf1pz6aJQEga9liLKDcdzCsnEA3SErnzGYPxTSPNKUnDx/Rt1Bb78BO3TPEQX
         7tXA==
X-Forwarded-Encrypted: i=1; AKwUvBwfnGqQdPNvI/rmjKf1YzEy2/7mEu8g4YKJ+WKKjqT0J83EFEk0FZx0VcZkehBZzpeTqdumzIieYdvXERM=@vger.kernel.org
X-Gm-Message-State: AFuF++n6QoXGeNaK9FRYhcSUjvDaOBANqz930041kBLX8ZmQsh7zY1oC
	kSpPzuyr5FRhzCgIi+oz7HahUamkIuFMff2hDN51XAi3yFvaaO/7NKl+TSbjsgnGpLVrZqdHrEp
	j4x/rQHb8loUU5lxmp6XU+86QMcKFDo4a0e9bM0D9
X-Gm-Gg: AYBFou2GD/oXSxWJMKOJ9r6KM5ya4RAQMg7atmv8Xa3V7XrseB6VidCaBHojQHb0ifn
	7b0i6JNzs6JLdDqjREGukwTc88J1iGTAkVhYUNPUxkfDY/xFLjZAVM9aPS25sOIpH61uVVqySF2
	O32YQZ6rM6IPgHc699hIHo0iY+Q4CMuA/JY7RgZ/zPfTHTRgd8uCHcCLmAbbmZOepxs0i8Uqsvz
	5CLRnKQ2d3lvLPiP/BafyYfKO1CrxW9Q0bcKnMJVE5AgDYu5BkCBV55XsBasduMvGlUeuTBGZPa
	IR/dXnkzE7m1oQ+7MR+bGQ5pKKrhmAhpk5UTOyii90mOfjCxMWHX5KxpbPy98CisjtCeRnEIt6i
	Z8GHtGY1AJ3YqKqmeFNU7GBp/+9ejow0bNNm2NG0EDQ==
X-Received: by 2002:a05:690e:4143:b0:668:42d:95e5 with SMTP id
 956f58d0204a3-66fb58f1410mr10675130d50.4.1788894372039; Tue, 08 Sep 2026
 12:06:12 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 12:06:11 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 12:06:11 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ae783977c1eaa34d2910f76dac1437c7aad47d93.camel@intel.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
 <20260722-tdx-selftests-v14-4-15ad654a50db@google.com> <ae783977c1eaa34d2910f76dac1437c7aad47d93.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 8 Sep 2026 12:06:11 -0700
X-Gm-Features: AcwNN1XsGt_fUaARpEZcGvQCOF1lLG5Qg2IcdgK2WB2r0fv2QH8UPnIsl3MEqiA
Message-ID: <CAEvNRgHB9Vhwe4kOGYUn3piw3dw8zqSgVQX2VonoWCYPw-TaWA@mail.gmail.com>
Subject: Re: [PATCH v14 04/22] KVM: selftests: TDX: Use KVM_TDX_CAPABILITIES
 to validate TDs' attribute configuration
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "Aktas, Erdem" <erdemaktas@google.com>, 
	"Li, Xiaoyao" <xiaoyao.li@intel.com>, "shuah@kernel.org" <shuah@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "afranji@google.com" <afranji@google.com>, 
	"kas@kernel.org" <kas@kernel.org>, "binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"ira.weiny@intel.com" <ira.weiny@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"Chatre, Reinette" <reinette.chatre@intel.com>, 
	"isaku.yamahata@intel.com" <isaku.yamahata@intel.com>, "seanjc@google.com" <seanjc@google.com>, 
	"pratikrajesh.sampat@amd.com" <pratikrajesh.sampat@amd.com>, "oupton@kernel.org" <oupton@kernel.org>, 
	"wyihan@google.com" <wyihan@google.com>, "sagis@google.com" <sagis@google.com>, "Gao, Chao" <chao.gao@intel.com>, 
	"Wang, Roger" <runanwang@google.com>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>, "Qiang, Chenyi" <chenyi.qiang@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "jmcrey@google.com" <jmcrey@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

"Edgecombe, Rick P" <rick.p.edgecombe@intel.com> writes:

> On Wed, 2026-07-22 at 23:13 +0000, Lisa Wang wrote:
>> +static void tdx_check_attributes(struct kvm_vm *vm, u64 attributes)
>> +{
>> +	struct kvm_tdx_capabilities *tdx_cap;
>> +
>> +	tdx_cap =3D tdx_read_capabilities(vm);
>> +
>> +	/* Make sure all the attributes are reported as supported */
>> +	TEST_ASSERT_EQ(attributes & tdx_cap->supported_attrs, attributes);
>
> I think this patch actually does nothing because attributes is passed in =
as 0?
> So 0 & supported =3D=3D 0. It does exercise KVM_TDX_CAPABILITIES as claim=
ed, but so
> does tdx_filter_cpuid(). So for a minimal support, we could probably drop=
 this
> patch.
>

For more context, Isaku suggested this in [1], but after all the changes
tdx_read_capabilities() is already used in the tdx_init_vm() so I think
we're good to drop this patch.

[1] https://lore.kernel.org/all/20220901012853.GF2711697@ls.amr.corp.intel.=
com/
>> +}
>> +
>> =C2=A0void tdx_init_vm(struct kvm_vm *vm, u64 attributes)
>> =C2=A0{
>> =C2=A0	struct kvm_tdx_init_vm *init_vm;
>> @@ -112,6 +122,8 @@ void tdx_init_vm(struct kvm_vm *vm, u64 attributes)
>> =C2=A0	memcpy(&init_vm->cpuid, cpuid, kvm_cpuid2_size(cpuid->nent));
>> =C2=A0	free(cpuid);
>>
>> +	tdx_check_attributes(vm, attributes);
>> +
>> =C2=A0	init_vm->attributes =3D attributes;
>>
>> =C2=A0	tdx_vm_ioctl(vm, KVM_TDX_INIT_VM, 0, init_vm);
