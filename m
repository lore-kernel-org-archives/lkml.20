Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793366122;
	b=MMFuPRwZzhJU1EQs/sVSMdkTwBBKFdyjfQtaTzBs1VCY7wQD59/agl67eAUvzc8cU01w
	 M2VW7cZ6jVHfW7R1zUKm9QrzPKXV/69hoX68pbwMLlZt6SX5kDojCf/+hlFNPN8zgBVQs
	 m3DueHvbtKKRyw/QqDPeAWeT8/HngTKw8rs8Y4zO4sB2SH4HipqRkf9V7RU/lHAXgSzk4
	 aiXlPphxCx4Oxn7Zw87LwVzcrivLfvqhA3gCm5Q7BjgvBCYd+jfuof3W10Pp72cIbwtZL
	 o1ptwruw8pJS+fhg2s95M+DbuYLrOayG5mKTVd2vVbPzu0G13oxWMpCgVEE6cY8xgcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793366122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=flSyLSnr13yYjOEHTPxlFf/254Itc/t+WXiaXgORDKY=;
	b=0QV6MTsBfhAVgHJHLWqYP/2jStkHCqxVpDa6vMxTS8AhgRY0N2NEYiSsGhjYjF4IXsu8
	 K4b9SKnpKyJLalLClJ0YCBTfJRbtTH4ik75mJ2Den8es/Vb5QB0v53+4U2FZDavQGonto
	 57Gm7GnYSvfrADvqhOSPjrJCipCD04cIGx+xHMBCaVegEhSrfh0eLjOwWOPDLFQBnTHCm
	 mmhjQurbfq13+qvdZgNP1E9PiKLKkNOgrkrKrzvBQ5PQsfzh6wG/mNrIH3C3V96Rg7i/5
	 nHunaeQ3pQ8BcJ7LkV74irzUx0Q47I/vYi59Nsrawavsz7a0PUkDGDfrpfsXer+1HCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XmP75mV3;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EC0606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45EC0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XmP75mV3
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-369f3e9e431so568503eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793366121; x=1793970921; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=flSyLSnr13yYjOEHTPxlFf/254Itc/t+WXiaXgORDKY=;
        b=XmP75mV3neSqZ22BCv35kRM/Wm3vPyca4tPolWX1a69c/hYMeB4QTg//T+7dyBId7J
         9kTrfUoQzQgh7Fv67xnr8TRo2oZ6DnGTuh0RJrQsMUJsvl5MGRki3phVoa10KhO6uLOQ
         HPKQ2Gknd8SkAtmVZJVKe1M/MiwnhMt5pB0Ot7VCXPqLwcJeMOmUv+xmLt9Ep1dhtv2F
         FTGw00XcOZC8XWJMdqeuVppo9LkVY20+uHvGckz3QFPbgS4qQzy+Nub8qDvbUaTWrdL/
         7HIe853SBAp1UF5XhHNpO4RkYDmr4a0H2fJaxobMV/Y6ZYFXSrfsl4C3O/g2dBw1yrEq
         GJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793366121; x=1793970921;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=flSyLSnr13yYjOEHTPxlFf/254Itc/t+WXiaXgORDKY=;
        b=Um4b/WHPj5vTTr6EKEJBYwV9x5uh9oSj2U2JDPTEKmDl6Kb2WtDYL26aSM6X0P17+N
         zT56s7Gpg0KMS5VgRqav4U9MKCveEPxk3sszxxd7twWyNNixw5ZzfRCLhm/XFVNoVS9J
         zCqHyHM3t3otws8U/P4ZE2nTurPNwRUCTUDuB1mpotT4ZSUCrIlVxD4c/k3DPsflWQh5
         95f0wOpjxc+ASraqpW5q2SEb4IZwpDj/dQ+jr4p18gizxTQgUp+j6pMHotUBMa26w+0p
         FVmjMRwcGF2sXo8BYZvMupiIljJMhkp9Hd6/iYQ1k+0rs99cDn1/VYl8oFuoFy3knGnV
         g6lA==
X-Forwarded-Encrypted: i=1; AKwUvBxDaFXcij1UkIpO6pNJ3XhdUIhi3TrosYaCHd5GOKHgris3/ugdcv6AK6cPVRFc3i+veCsY4sC9E7rKnWo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1u15jE8/nAX+nwNpfuUo3HgFRR0h9VvB2JnuY0WcTwhhJTtsk
	zLmPyTzJHH0Aru/9UtIcOj8IsfbUeO1hnS2/wVWdOodVm5UhPACkkv4h
X-Gm-Gg: AYBFou2OM5YEE/0HJX/zXSOodINLzgAlylKQJ6wgwUs0uxy7ZgwuRYayrM2lvzidVic
	rxXlRc8AXEA6U2wtkF3PJ4pSMdDnF8YCGxUVEb3NtButEPye+NIpgTWzGQ67icC43pRqdXi2ULg
	elq4zEO39MmI6SHQuS7IFbKTnKmvgLr6vMRqqCv7nvFmsTtdHYof4V6/dyfx6Zt7HaJzlnYpbk+
	buHWdO7CQ5rJ1Mg5vR6i/gShwgYqatrp130A1yn1+aAUPFoc6e7uUNPuYtd9QHajPjukDRcIl/n
	asvJ49clSSmw5nNRoz8lH78ysBQORlvTIQ+g0+G5Nl+NinqK1ZrROV67cagtjWTg8y23S71ZtP8
	pR2HIXDEkLkBLF1v2yYphaM7vcVPsdVUNUMvlWwyDVHS1jXuAjihX2jZNdWzM0aIW7howmZqBcs
	/fCOPoRY9I3iv/XEhYX4PKkLNMzVLGr/1WPBWTtxJzLFLFrAFfZaBQ+HiaCG6iTg7LPpMzQh77y
	9L/SMPsG0IvujL1hS6xNtngpwpqSRUMKFzuIQQOGcQmXoYKRLZ4rAnn4rvW3VNpYMgwqyMGQKyH
	2eCWlbyqscKifJmOwqipL0J4Md0=
X-Received: by 2002:a05:7300:3d0a:b0:35e:2c6:d462 with SMTP id 5a478bee46e88-36a2fc203c3mr7157186eec.0.1793366121263;
        Fri, 30 Oct 2026 06:15:21 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a426681aesm10056827eec.1.2026.10.30.06.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:15:19 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Gautam Menghani <gautam@linux.ibm.com>, maddy@linux.ibm.com, npiggin@gmail.com, mpe@ellerman.id.au, chleroy@kernel.org, sshegde@linux.ibm.com, amachhiw@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 2/4] KVM: PPC: Book3S HV: XICS: Update irq_type for cleanup to work
In-Reply-To: <20261012082922.218799-3-gautam@linux.ibm.com>
Date: Fri, 30 Oct 2026 18:43:54 +0530
Message-ID: <a4nvwctp.ritesh.list@gmail.com>
References: <20261012082922.218799-1-gautam@linux.ibm.com> <20261012082922.218799-3-gautam@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Gautam Menghani <gautam@linux.ibm.com> writes:

> In kvmppc_xive_connect_vcpu(), if any failures are encountered, the
> control flow jumps to the 'bail' label where kvmppc_xive_cleanup_vcpu()
> is called. This cleanup function exits prematurely since
> vcpu->arch.irq_type is set to KVMPPC_IRQ_DEFAULT at this point. This ends
> up resulting in wasted memory.
>
> Fix this by setting irq_type to KVMPPC_IRQ_XICS before vcpu configuration
> starts. This makes XICS initialization symmetrical to XIVE
> initialization done in kvmppc_xive_native_connect_vcpu().
>
> Fixes: 5af50993850a ("KVM: PPC: Book3S HV: Native usage of the XIVE interrupt controller")
> Cc: stable@vger.kernel.org # 4.12+
> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>

Mainly fixes the error handling / cleanup routine in
kvmppc_xive_connect_cpu(). The fix looks good to me, feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

