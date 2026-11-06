Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793941288;
	b=J8+ByyKszBfG2FGfRv3UTEBgGKici44kv2dmSL4IhT1878nUFz5kjAbJFMROHxtv0kfk
	 Z7IHi5dU67c9qbm4hJqKfRarW1NAHlijSy/KC8SIEQ51SUJF8F2hm2ny/1SvURYSVOY2g
	 q1UqoE77t+poocWuh8cVHSnwzNUnHUtvfiW6MtRx1vmwh4AEK0EeITVGQmlQy0V4i1A0N
	 lC6T8Tr5wA+3EbXi5Rmkjxu0X9oPk8Zj4nceOk3AvESmFt4UPrJZZtrJh0WiyBIrIDBYV
	 4nO3Xut6+4aWzPyGnbm7V0BwKvFkQk/s4gGLcqBDQsU5fkChCOeJAoQtzaoPq4q7Y3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793941288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xtLYzvB4QwyE4CQQZBVQ03agWEuN54VOUX3M+RpRBBA=;
	b=suLvLg58aWdim5FhRxpO5nrOv1f/Y/De05EQHK1KfZxljDqja5VdS1xFQtghcAnwCKDI
	 c08me8mmywYBukYe2A09WwAfFuPC+85DJBywOGjcKMoRaSOa5WVNdHCCABtiHcAPpFmHg
	 PV1qkiXmb1AU6iXQ+/FWlFxGiGcHlShrrMcnslL+ZaDuVHCpeSrhE4rPaBLlaatCyvC2j
	 R4D/N+Dago4JD7Wxy3AzfgidEzOEyDob/GSIHRuEsV+VzJRat/Yu4u906w4rCpQ/dDoNr
	 cRNjO6Kadc6vY8iQ6QBIq5DQe1uupVO8PP/uVxjqxs+TwusUSFBqmktxVWaHhkfaUUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JetxdjpN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C464606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C464606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JetxdjpN
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5383c97c8cfso28151cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:01:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793941287; cv=none;
        d=google.com; s=arc-20260327;
        b=P0rTeLUbUGJuMjEWjdHQ7lPgKmOnslFS1dFzmYftcI02vYzDnWY3S2XCa87sqKl9Aj
         oKXkrchGpcyQ9GRGattnPOKKKLnIc3lQbm0W/LMPLjPpGb1QhYEstFNIzYhAZl5hE3xa
         v2cNK/xUt/IQ0CYDnz6bOLBv8OZjWhZRoX++F1Bx+tIZWqJBdhwfhOoT9rF+OwYnyCx7
         ThWOawhmYSn1NFn+mp5EXdAKsfRItw9bDJDwdZTVO3eqbnFnZ4sPJ6ZbEzuQEklRWEIC
         MpwVuQOjHsZdAtgCTvhlJufNyF/DtZeSJfGN1x+JBloT5GIkZ2db6FeLNu9dwHQe3USg
         Chvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xtLYzvB4QwyE4CQQZBVQ03agWEuN54VOUX3M+RpRBBA=;
        fh=6/gDwaaCVBqeGgI+5TO98EdquIfVTeJXactzvSBGJJU=;
        b=OqhI4PWFCIHqcozwupCdfjCGNuCSGRVCVes1u//EKnD3TYBeaTibwYVaSgxStvIC5S
         8qYKK3M6xrx6fnYBys3k0vCYInYW4VTvgdjtkqR/HI2GWBGyxjXeIoWqTpIhkA6I7lJ8
         lahq3OFWJ+nx4dORaDlVBZWcz1G7yxHWXP72Xjx6JZMDpsoEKO94YBSZmjAmgg5w2Z0F
         CStYARpQgWFyb0unLUc9/2O+gaRWlfmA2YLSvB6KAemlg4YtQrtJIuTZrLvB08ktoRaw
         PjFulA1uL6/+IBdOnzQK1v/UH+KDbk7HBt0/0175JHGI5l8vbF7zbse2Bnt4gF6Khxlw
         4w9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793941287; x=1794546087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xtLYzvB4QwyE4CQQZBVQ03agWEuN54VOUX3M+RpRBBA=;
        b=JetxdjpNy04qLWgZ2MgoRuiFvxEV51HgOqbtf7EMMncLAaq+SM2kbVWZethMJmbGq8
         hJ829usL/kMbPBbHSdG4OeW4jLnU7gLSsCteTt61KtGEItKyTqm4CzGmiZvoSU9vjti7
         H690meOzJs2mlQ6Bho9bVL209h4h2oJo3XGDPJdYqwusfue7laXufhBIvuN33Yi6Ck+e
         oaPzgQK/eiO70nTmrxqkg4bCNW8r3HF61N+IqCPNjnEoqe291qHZxQRXGaJzVpsErD/t
         9+BRG9xNz1btvq1P2T/TQAqUe8hSdegSsVulMtVP3YG6tcVlStl0pNxxiQRob6LSIJ5f
         9gGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793941287; x=1794546087;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xtLYzvB4QwyE4CQQZBVQ03agWEuN54VOUX3M+RpRBBA=;
        b=jK3qV0z6F5uoY64xE+uMd66EQFwN2oaOs7mE9UTvgFeM+Hh69te4BX9G4Sf69wv2Js
         utMqoV1ipwecV7ugz0u/PqxboYUzFyrpzFjcxLc70GduviwNptGI2W/oYCUKIJLhFNxg
         EvAr7Nr9O0OhN4uC6ZREFhD3LEbud62OHpxGiUuV8KKFKtMlX7aDYca1n5duYhj3D6Gw
         ZM1wv+11lnTtoX4TpaADMQ/W4tOZJe5N53BwurEX7FIj1Y6guJuSu8EWMzLNhDIiLBYR
         HSq2XsVrx+KJ8WXoRooHk/zY4rY5qbfxZxEDWlLpp+0Ib9UAuLOdwNNDOpwmBm06sVaz
         qaPA==
X-Forwarded-Encrypted: i=1; AKwUvByMIRM5d6tUylThu95Xh3WHE/Sjc47j6dILnb7SU8cvoapI+wgGNXRGfG6ZPthcjVhN1NOGkO/gNOghz4w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ipgVf71Q/NFO3HeTjUTmNd/AoGEG0nQbx2PGev7lIExH/kkPq
	kgrfcRXSFD7vMGt4w8wo5oux/hQD79bdZGo3g5EcJ9XtI/zM033TuJIqBVpbgmfbi1gM92sklb1
	z+1hWhBCHThnbqH0CDgFCNAhyFs7k877EuPkmTONw
X-Gm-Gg: AYBFou1FlXQAZ/lbD9voLMr4W4pKGmfcISGn/PtRTzyLtwEZUK61UwL/+ZzCfK4caPn
	LALeU2ylb+88PfCFheui9tHuYBnBqm7hSemF2Kdioyivfpc41b7f0+uM6jhjwEQomm6jfekGk4G
	az5wPs8FGwN1cK93LKFjWGrfneMeMGpGwtleFJuHcTFphzjWC9+sc9rbWqb79y/ICszC2HSXA9b
	PoiBG4Tq/7GYX02YClgKm96uzcS6SyFNAKWrRpAtmnIxXTHc7NJsAMWRRrrGiZwrjMgvGgjL+aj
	7TXVZYrFWxx4YcJ9Fev6lCuDN+On6p9AKIms/4BArgy3Kl5qHQCH0gBwwm7vQMD3YG7HpJZExD+
	2RqHEGncSGYI9iBWZEHAfVB1Lz/qnbJJNkxodF2dQlhL+fCq9KQvLMJUb3PSTUPe/ILsIQZChUA
	NIami+Zrt6BVyKtzQ48DxwvtXl
X-Received: by 2002:a05:622a:250c:b0:52f:9ed4:8d76 with SMTP id
 d75a77b69052e-54eb746fba5mr594091cf.14.1793941286561; Thu, 05 Nov 2026
 21:01:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930210750.1487547-1-chang.seok.bae@intel.com> <20260930210750.1487547-17-chang.seok.bae@intel.com>
In-Reply-To: <20260930210750.1487547-17-chang.seok.bae@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 5 Nov 2026 21:01:09 -0800
X-Gm-Features: AclHuK-ctdXjo8QN3yQuitGR3bekhHL6BOFHnzufPuigJe6OXqS1fnnmKMIqztE
Message-ID: <CALMp9eSp7Xj-z-8Wj=XA+KEk1XKTWpvwygWpdgzKeKQmDCobVQ@mail.gmail.com>
Subject: Re: [PATCH v8 16/20] KVM: x86: Add APX to supported XCR0
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 4:07=E2=80=AFPM Chang S. Bae <chang.seok.bae@intel.=
com> wrote:
>
> Set kvm_caps.supported_xcr0[APX] when the host has enabled the APX state
> along with CONFIG_KVM_APX=3Dy.
>
> Tested-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
