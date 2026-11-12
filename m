Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794525434;
	b=W/YDxMCcW0XPFxoZBM0omaeFzLXaBg/sbGVLi43avb9pirdDbFfBQBUhuc0Hb21acuVy
	 /blIZav9JItE6BTrZuX666ADPRwMFqBeELawvYGMKev7qT04GQGQhyq1Oo+gQ9Ilgkfbs
	 IRRKW+xISiSKDTq0Tx+ZkfX8tLZBH+PJo4EiVq92wbv07yYip0tob11oHnZWpafG3Tqnh
	 5HkJiBHK/SFP1R/1CFWMbvR0lZeSBmW4UDQQ8JrwmeFd/OCApKKVa1eMCAhS1Lzxbhd82
	 Iy7GPjRtHuuWmXSASXyujGFcJqP8xmYTWB4m/+qJ8/aoF972KVpuj5/e/5GoutLvu6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794525434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HYer4KNej6OjpPHSLUJVrnFp2nfCzxQPfaR3MfS134g=;
	b=M6tLHmPfd5RhF9QFiY37GhgRT4uB8wimZbcxb2uUKrk7h1gfaZ0BSdvkU11NeL53SQZS
	 II3CU6GvHvmkO0Vqtr2I9eXg3WQrhI4cvPAx/D29nAlLURaRTsZhrurs/qXs/D728JQ0X
	 EWGmwIABYmR1zoSq5Ufv184USeWe+ZWaWUtRqke45HZmwDCZfd4u8frKaRa2zt7KyF99D
	 0sQzJA6eh7jEslaWWC5tGHlN6UIemm9IAH3oj1vprKIDqhIoZIlvh36S+N8kCRZIo30Y8
	 vPactnrN7N28mQnNYGn3Fq5DPUh1/bnOFAcLu6EMBVd1yfNQm0lVbPvmwLKmmtEAxbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=efvAcmws;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6671606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6671606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=efvAcmws
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b71ee00f0dso533a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:17:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794525432; cv=none;
        d=google.com; s=arc-20260327;
        b=m0mBq2FCRUdMktjE/AD9tuBQ2Jl5RuGHZmKw2WaXm7nTpNoXymZUNSgnDWidA6noZC
         8/LI6Zbnvtam8Afm/frsADLQtHjqHcSZtRbpbToPEwYXe+m+Hgy6QV396y3320np813Y
         0kaOeGnvC+Ng/np/3EiVASidd7NTFOATDnwPsDskVDpXZsK5Ig1AUAt8Saehc03B2HHp
         juQdnKecS4qSdREHm7l5mBLf/hNKJVtmJ49efy9MCuu0GuOKzxl4HhrEU9iVO7VziUFH
         pQwhKC6imKeTJUTOQejHVJ/tjFC5T/E5iLfltvefqnQPrmWKHMc2CGj47w1StkeYWC7Y
         UOLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HYer4KNej6OjpPHSLUJVrnFp2nfCzxQPfaR3MfS134g=;
        fh=zkBKNM/jAsRc9TITnBK7dgoG/+XpsGpi4EVUJwaU0/s=;
        b=WmP3GPtqCL5M2YZLb++5yBTKgdDuXfobfwM+CQmkrBe8gAF+puUApVB5sqzstnNdoP
         whoZX07cza7gTueFN3iqsQ0c7DoiV6PawjCj08WUsHVJEMWlfYyRAvlR91aOKD9kuyOp
         EaMNHHW/WJ65OIDmG0YpWQk07biV+cLY8DipMJBZ0qtfhiobLW6DrFH+2DQ63ge4w8Mc
         yU5++v5g34duKweYbZETUHFnGd/CP63JPlrXxgPa83e9IIA9Tp1ADMvpQI6CZ8a1/9AL
         LcL1x+NbJ93I5pvxa0dA307aS0Vl+KAvbARTZCt9HsucWCxm9AtKFBSuwV2WxHkbl2JU
         T9xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794525432; x=1795130232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HYer4KNej6OjpPHSLUJVrnFp2nfCzxQPfaR3MfS134g=;
        b=efvAcmws6mhucmMwtkeQlmU3MLbS53DQ04Wr3YnRmRD6wIfE+rw7KL5dIx2p6qIDXS
         SO5kDbGGsUeLXiZu6Cf5P4opNv48rExtOY4DuVQ9NgPgg3hV2ZdQm/7v3fvs0AWzl54b
         7SU61YK8w346V3DYAVXp5xQU/RB5kwS/LTyatJvbVBNsZA5k1bqATk9Auujv3dB1918l
         6CuZoA9+yOIqFaP+/6+lsSq9AQrmIN2+ALBeTetWFLgmt06uyZpauy7tmcxwVJilOa9x
         MlphQNAPsVZ/17fIAnI0lxNc6jyFJU5BRXU6iIoOGf0TbBLXpbfwsj7BUfrJWnnmzsvX
         P7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794525432; x=1795130232;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HYer4KNej6OjpPHSLUJVrnFp2nfCzxQPfaR3MfS134g=;
        b=2lIB3hbtaxdiYWJCltU51ovHZel6lMO6kcHWK6clB4wUevKtGOlZNTwNx1PeFr0OCt
         TWopAWzDLz2JBnPFMLhRYxr8bhLcyxHDictC+ALjAoeBt5dqRhVwuTElKnwF0lAlYFDE
         tvn3uyzbAWMqDetlo76Aha+muCyLKzdMdeptyaXSKGMzb5P6ZgSO2DaaDaP5oPw4SwOD
         FGmdgwuklIYr+Q0R1bfNy7Ot+VIlQ23saFA3yz0KQH7/dQwCL+ke7BSbv6NnxE+OaWCb
         2Wwyw7PBW6rB1fOKzmJL8lCC7aCRMkzmpSINZDy6+UVLvyF38h5g0WmZVJdTnMEkMjU6
         79Sg==
X-Forwarded-Encrypted: i=1; AL+hErE6D0iwDht0eu21tZje8pSghAzczdbFFgtia40PKBbMBOAygo5hhtj2dZQkohlbPbI/Fv1WcilYaA8JXow=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/tS3Q2uYi0QT1FY+Ju7iOymthRbm+4BwaA5dzrzAIWM+GcZaZ
	QMapy/rKdOLEfFU+qvtym9qJ7w9Yd4uRqxn77Yc61wqxzSm+AyS1nBOjUqE2ygLBKChGBfdX0cm
	ZPVC3ycGj/PylGtX0PGchavo8h/fFuAUiIVKkSZsC
X-Gm-Gg: AYBFou2satJ2J4kjeoZZzkWxZIcjyB5gaxDx7RamPnY6MQvzQBpeUocvjUmPOmyRSfU
	EK4UhLcK9roTiy1jwhP2PAv8tVE4pKcH81OBUrYswdct7PKA3rIABh6+ZwKOig6NupYnv1bmTEp
	QHc9dhdWbsVeslQMOWY2UAp9+oKMxQXehoEWUXy3Mzef30YufI+BeW3WT5g07w1HBegy2P7vTcU
	b/JoK/lOSB/gZ8OIGE0thW9lv4bWt5B8FdiqGEXgEN/OOeJU1iAC8sDOYn+TbOVAUeCZZvdLXLD
	aoGzExEEIuO1mljB7YyosdumfdyCyBhawMTtOoXAg1zQarz0Frw+R4hXEXcq+EIZKFiGpFehxeO
	5S+Tq7FzoVelfCokyRfBc39UMQ7guzD1exGd/mpHMFE0WMZHAbNSRYnX4q00fdiNaEblSFTg/
X-Received: by 2002:a05:6402:1246:b0:6b6:eccd:ce77 with SMTP id
 4fb4d7f45d1cf-6b7c82b1e66mr16244a12.9.1794525431853; Thu, 12 Nov 2026
 15:17:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112212628.265262-1-jmattson@google.com> <CAO9r8zMkKXRT0N18haYG+=jyO6FvL7VE84-=n9kpm7vnARH5UA@mail.gmail.com>
In-Reply-To: <CAO9r8zMkKXRT0N18haYG+=jyO6FvL7VE84-=n9kpm7vnARH5UA@mail.gmail.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 12 Nov 2026 15:16:59 -0800
X-Gm-Features: AclHuK9ZK_GSTisZi4uuT65jTyFZEXSzRQMsAQ_YhJ2__8gddMdEVlL8gP2vTNw
Message-ID: <CALMp9eRmJ8BpWHrveE=nTD6vF9OrB=OiwNA15_4Df-=kUzmMnA@mail.gmail.com>
Subject: Re: [PATCH] KVM: nSVM: Gate CET state copy in svm_copy_vmrun_state()
 on guest SHSTK
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 2:41=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Thu, Nov 12, 2026 at 1:26=E2=80=AFPM Jim Mattson <jmattson@google.com>=
 wrote:
> >
> > Like nested_vmcb02_prepare_save() and nested_svm_vmexit_update_vmcb12()=
,
> > svm_copy_vmrun_state() should gate copying s_cet, isst_addr, and ssp on
> > guest_cpu_cap_has(vcpu, X86_FEATURE_SHSTK) (i.e. the feature is adverti=
sed
> > to the guest). Instead, copying is gated on
> > kvm_cpu_cap_has(X86_FEATURE_SHSTK) (i.e. the host supports shadow stack=
s).
>
> This is a bit confusing, nested_vmcb02_prepare_save() and
> nested_svm_vmexit_update_vmcb12() are about vmcb12 <-> vmcb02, so L2's
> state, while svm_copy_vmrun_state() is for L1's state. I think the
> patch is correct, but the examples are confusing.
>
> Perhaps a better example would be __kvm_set_msr() and __kvm_get_msr()?

Or, perhaps I should just drop the examples?
