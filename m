Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.157.188.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794850130;
	b=gQ78rru2FwIKBCPjqb4sPu/2kcan5muOauh2Tz8e022GjYdc8na2bzxy+e9i7IiG5HBM
	 MwXRtBpcrqgHgwwgDb3UNhWrOk1Cs0IhGkVl0pVNQbQMcwphdgPly576Gc054up1hFruP
	 HpOsKFdDUfEOewgPcHvCDw8mAPZfP8tAjERym4wdLn4HHMh/oEZrTBizuAHJ5K6KByC4c
	 vWb2H/+K7oB2NiWwoDfObsH4TxOPkmtkCV9LZMb3ITU2CljtVzpm7aboruLfgKhDMmxVv
	 HPKib914qzS70cU7jAnLYFyEyZtJt8H2bm4Ret9BCv6DIgVk6cQANagWCMkAERY70hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850130;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 Feedback-ID:X-Infomaniak-Routing;
	bh=sksj3erO0Akx5zzJjGKDAnrGDqLQmFXWSoMgfv5FcBI=;
	b=EzsxXJgcxxMT4DtZqbwFfduzDNCN1DilCKwoYMVletAdrt3BEtgOlcyqBR9uvNFKpsis
	 N1MYUSsfzn9T7+lQyUGXIkiEmLFmW2x+dieO7kzi/pcAW34JhmPZU/3nT1Bj0xanTOlK5
	 Uq8LcwP+1vtXuPO/I2LWcSWDbffcEPQYh2UkLlLJRJXTlrRMpGB6o08xrUD+C52xSFg9N
	 +pmgaadsUa9KI5nFaJ93/fn8ciZddReNaijiUcDOvhpSWz1DAZYdtBogiFC5AwFZDbrOl
	 3Cn++SWQNXvI1b8lLjNh3ggPLdn27mPANLP87xZY9oLJqKGsxbOJ1W2sFTzXZm8AzHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=etik.com;
	spf=pass smtp.mailfrom=etik.com;
	arc=none smtp.remote-ip=45.157.188.14
Received: from smtp-bc0e.mail.infomaniak.ch (smtp-bc0e.mail.infomaniak.ch [45.157.188.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6860606A337
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6860606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=etik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etik.com
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jSvwR05KVz2kNw;
	Mon, 16 Nov 2026 18:28:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etik.com;
	s=20210927; t=1794850118;
	bh=sksj3erO0Akx5zzJjGKDAnrGDqLQmFXWSoMgfv5FcBI=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=cQxdshKVjvsM39W9Gap2BRzIbXEaf1d/No2nWFKAUSwvNOUV8gHSyKC6R2d1cBd0C
	 MYDXtX311AflSc+xrxIyZzAIJKlRBSmJPWHwajQQAvOoDVjRXhbkkUF8hQv1ogIlAi
	 gGhu6QsEblH34EbgOm93qm2GRqDN3dpaW0DQdFEE=
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4jSvwN6vjBzcsX;
	Mon, 16 Nov 2026 18:28:36 +0100 (CET)
Message-ID: <999079c0-c728-445b-a122-720d93f112cc@etik.com>
Date: Mon, 16 Nov 2026 18:28:36 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: DV <dv@etik.com>
Subject: Re: [PATCH] kvm: hyper-v: Delay firing of expired stimers
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: Alexander Graf <graf@amazon.com>, Sean Christopherson
 <seanjc@google.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 hpa@zytor.com, x86@kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 nh-open-source@amazon.com, gurugubs@amazon.com, jalliste@amazon.co.uk,
 Michael Kelley <mhklinux@outlook.com>, John Starks <jostarks@microsoft.com>,
 David Woodhouse <dwmw2@infradead.org>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-devel@nongnu.org
References: <20260115141520.24176-1-graf@amazon.com>
 <aXO8I6xuZyZB7CxV@google.com>
 <769f538d-dd42-4d36-a4c5-7e6e48b209f6@amazon.com> <87bjigaeyx.fsf@redhat.com>
 <1435d106-d4b0-487e-85d3-4032a9fe9332@etik.com>
 <kupzev8hf8s.fsf@vkuznets-thinkpadx1carbongen12.rmtcz.csb>
Content-Language: en-US
In-Reply-To: <kupzev8hf8s.fsf@vkuznets-thinkpadx1carbongen12.rmtcz.csb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: :74c292bbbde641d:ham:123049f310c9d1d
X-Infomaniak-Routing: alpha

On Mon, 16 Nov 2026, Vitaly Kuznetsov wrote:
> From what I remember, direct mode synthetic timers were added
> specifically to aid Hyper-V-on-KVM case as non-nested Windows was
> preferring non-direct version anyway. So I believe we need a fix and
> not 3).

Thanks, that rules out 3).

> I'm wondering if the issue is somewhat related to the nasty hack we
> put in commit 0469f2f7ab4c ("KVM: x86: hyper-v: Don't touch TSC page
> values when guest opted for re-enlightenment") but maybe hibernation
> is somewhat different. Or maybe we misunderstood the problem in the
> first place and only fixed one sympthom of it?

I don't think the hack itself is involved here, but your second guess
fits what I see.

The hack only takes effect once the guest has written
HV_X64_MSR_TSC_EMULATION_CONTROL. In the failing setup
hv-reenlightenment isn't exposed, so KVM recomputes the TSC page on
every masterclock update and every KVM_SET_CLOCK as usual. With
hv-reenlightenment on, X was 494.7 ms and the timers were just as
late. I didn't trace whether L1 wrote the MSR in that run, but it
wouldn't change the lag at boot: L1 enabling the page sets
HV_TSC_PAGE_GUEST_CHANGED, so the first setup is computed normally
either way.

What points to your second guess: X is already in kvmclock before the
guest runs its first instruction, so when L1 enables the TSC page,
KVM writes a tsc_offset of about -X into it. Yet on a boot with no
pause and no migration, L1's counts were still X too far out. If L1
used the values it read from the TSC page, even cached ones, it would
have been right at that point. So L1 seems to take L0's reference
time to be guest TSC / TSC frequency with no offset at all, perhaps
because on a Hyper-V host the two start together.

If so, the 2021 migration storm and this are the same assumption
broken in two ways. The hack keeps tsc_offset from changing after L1
has started, which helps on migration, but it can't help when
tsc_offset isn't zero to begin with. And without re-enlightenment,
nothing keeps it from changing on pause/resume, which matches the
virsh suspend result in my first mail.

If it helps, I can rerun with hv-reenlightenment on, trace whether L1
writes HV_X64_MSR_TSC_EMULATION_CONTROL, and repeat the suspend. If
the hack engages, I'd expect X to stay the same across the pause,
while the timers stay X late from boot.

As before, Claude Code did the code reading for this.

Thanks,
David
