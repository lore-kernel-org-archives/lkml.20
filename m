Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794498640;
	b=t2at07CvEmUtnJRJAgiTlN0R86sz1sx01veDktIx9FWuWU68xSFbnGepnqxS+KUcdxvy
	 ZpiMMZD4A2oTMOjQJQXlzdr1FQ0Rod8IBtug5+sniSVZC9nCdM2IqEGtJ9+vIw73XHyHG
	 kls3nutjTgbboW1Brs4xasRcy0DR/2gqSSG4dM9+iex01co/6uLEYiK/t1AetTkVOOVVQ
	 dCuoG9VRMU2rkVNjQC540LM7UX13ee1t+yWGDPQlP1UGS8uIxFabC9TpIpTiQYCnxGlFg
	 AOYJuZx7dy3HC3TnBz1AyaNlJWrR1707SulYV9WPSWck3cZWs6ibdkhxmqMXVHOrOtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1J5Kag5a9R9WjXv4Vm2podHkmWJUILcyb3bqAyrnJ/g=;
	b=T5ALaB1ANmHhtwHxW5yjq4m0xkf9ZBsEgcM7FBrLW/F6VQIGA3LUWLJonRewxgyTEzYO
	 G2k5HQ75q3hbquTNmp8dkcnywIYqBfTKam9gHMAgfWgwZYgWMZ7TjHPdstAhbnqijA93F
	 +9JcLjlWrLCC6aWdc80LMjhSDJgEiuu1yuKuN4ZoZyi2oB2AlRE+1jsiz5xORN/yFk1Jo
	 diI5BeVN2vGvoRxtJJ0Fe2bs616Kr4PcEiMallzqUdOtDzZ6D15Vlzp/l13aeBRNh1Pjj
	 epVWPmu9X7P2ktbFfSuAf1E7YInhh85nlHErnT/pbCuARZNUKuvXkoEbb8DwbzLb4HQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mp3SDaMN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFAE606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AFAE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mp3SDaMN
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5383c97c8cfso272901cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:50:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794498639; cv=none;
        d=google.com; s=arc-20260327;
        b=p1+oqb0UGskkib5eW9Fb7AeR87hsTlgWvIBrrclAwxfbhJyjXU929bUh/ImU7AcMBx
         gn14V2vj/7iCtCiy7CZYSuFszbChUfVfnwJPj2rfrSVcMAeZuJTaJKJGJuxJQnRJGxtU
         Svci+b0fswiFmRnwDJULwRIni1CSlL3qGo5yswe450H7qjmzjo0Y3V9Vh4mRTSmVL4ah
         cy1k7Nbhre5mkqbhvv9A9CoumCMgxKEwEE2VxdxefXnP8kjJec6KfoSygH2r8UgKbFOy
         p3oI85lGzJO08j3j2AMEXpjcu6lN0TJL0f2EIlm8GqmQuHumLY3RZR4XPE+N4bd7nit/
         CzGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1J5Kag5a9R9WjXv4Vm2podHkmWJUILcyb3bqAyrnJ/g=;
        fh=yFLNSNs8Ru+KqvN80FIAsREMys9PAH0OFtMMaVQezyQ=;
        b=k6Ut/U7aFeNXWgfF2gLTmqEVn1Hjogp6u8iOylR3lrU3KQxrjllC78B1gUJIqVDpog
         oEvRTlKBqsk0wacTvNlYU32o0uxSylvqCB1xkG6IwjD3IiQvlYeLbh1rUJ26A1NoeQf5
         BtzMyFDH4IKLgrqLoSP7FlsQEtGDe7/TozD5d6Ogf/LBXo9gHzv6qE93t1Lz3a9SDBR0
         E6DQW0ByMF2Ud9oUf+//BuHqdllPdQCVA6+Ur5UciC2owk5DrJKhALFOSY2ByfPWurYP
         DPF14U8L32CRXni0uakFa543pcV5c727fQHW2eNtjoU9KIAWCh0eKQJbBIvFWO6c7Fuf
         iXMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794498639; x=1795103439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1J5Kag5a9R9WjXv4Vm2podHkmWJUILcyb3bqAyrnJ/g=;
        b=mp3SDaMNkYr7EcFK2XDLWz+FCR7u62/Q0PQ7DbkSrGGm8vZx3BirTekN9Bz2w778JC
         0majZE+SgSCzdwzgyp+tOg+ObYfiF+LZn1nV4/zZJTpmgWTjNQH5UfKSI5owHUuQBeNo
         IsAltOhADi6WxE78meSP12d4P2OnAj8rsl47d+yGOfdYQoYzAGHHzQBnAGA79SZ7k9T9
         MB3D8se6s+zlcUfWxED0uqyHHcPVsFPZdRkm3gmwQ0H3d1dp8VzrknhqeSpaZlV7NCDd
         mCpDuf/0CMZlGqFf3dbicf4sABPgz4Rmr6Q183tOqoEjHKGxpPIpfIBeVYAMQ2Wv8Qve
         QnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794498639; x=1795103439;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1J5Kag5a9R9WjXv4Vm2podHkmWJUILcyb3bqAyrnJ/g=;
        b=LkL9ix+Grh1yItbNBxuQpMdLTyEbdjQpHZ8f5JBXRNdkmn1ZWKdOqppBA5/TtI4CAE
         43vRpCv5iPOXbXmw3wzMO0/btHvsnOFepEZkNEPZZKCNuLcYK/LX3SsCXLOjdFCKzdus
         Phc1MPK8qlw38xfvIodXGbJDsuGr5rt/JuNPe7LzyDTzBuo6UfOj4QY9FJykhOakLC3U
         GR2BPIQ7N9YnDarUkT+0y1v+d4saXf7KjCk5cBL4Yx/cdSGDNqb5IVMI1pky+4JtIHf9
         FUU6HwrFbtyZ518jAfTpJs0jQ9whW1DwrRe4ZqtcME/p8zSUbXACm5abuDuPYs9FaeuA
         z0UQ==
X-Forwarded-Encrypted: i=1; AL+hErHbBoXtGWUYslHndUxFBFEgUFHT3QVjuWbUD0jrwfQU3+h2zMgORd3deJ6DlK9bEkAWUcPYvZW4L3zEOuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+s0SoAjnVMFiUieqxR5b9gBk9Bk9vlKWtFW/HOkxs+V893ensL
	CnZ+l0KxSJk5TOYOKiyrJ8AANOwLIx64XT1M8E4hV0IrjcovqtV2+vbWXTSdPJRKWpogpn1AdvT
	dz4cNkvFfOaYwG6rXcItT6/LDWCe52Crqkl1FhuB3
X-Gm-Gg: AYBFou3vIpRiNJE4DR3fnlkiRl/zX8MQAPf+uzyDnx/kJqQKjThkOyoQPw3SIb5QC9K
	L9L4X323XH5kiEreRqYVygufu+PdVY8K8bWRnq5REJGgBQfiSVH8sNZecybXVPzk35RS8LxmIP3
	KiCSiK6y2t/nnETm28KfgOvWGnEwUKUuHeK5oqNxYMri/XVXjshzlHl07aXCgNyfpwqxf9eVzj0
	p4hp285nQamrmVzYps7lC/VWTt45DSlJ0P4P4iTMlBac0M5Y5byx+qQJ4y+6MKzOg3vhw9ybC+p
	unlUFHrHnFTlBT8XOJctATAoZRLjNR7xXuiilMqE4SXHqkZHDMdclWNfVBig9tiWRvGdv5xwvNG
	H2QY21YhOdpzhP+NLW+al3jK5SEmUP/MfufOl81F03mrec8ESbSmOP2MaMqDW/w+l3MCBUbA4Td
	FuEDtcy6329v7SWgtsgmz2ka5JwA==
X-Received: by 2002:a05:622a:c14:b0:532:8423:1e78 with SMTP id
 d75a77b69052e-55990231239mr18865281cf.10.1794498638566; Thu, 12 Nov 2026
 07:50:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110112546.261415-1-hao.ge@linux.dev> <20261110112546.261415-2-hao.ge@linux.dev>
 <CAJuCfpHjSZhPPpRudAdrDPzz8dGK=Mx62CYCNoO4MC9OhnGd=A@mail.gmail.com> <aa6caf61-a4a1-4c51-aae7-ebb767f3430c@linux.dev>
In-Reply-To: <aa6caf61-a4a1-4c51-aae7-ebb767f3430c@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 12 Nov 2026 07:50:27 -0800
X-Gm-Features: AclHuK8tTrX5dxrTUPnpF2OR-DhefKyRTvk3c3hlnhcxw9TdWFm-p4sWJVSI-pQ
Message-ID: <CAJuCfpEC-YR7NrX_J4U-eyP-2T=E02OKKEO0eSjFMzja+BFLww@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] mm/kmsan: undo the shadow mapping when the origin
 mapping fails
To: Hao Ge <hao.ge@linux.dev>
Cc: Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 11:49=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
> Hi Suren
>
> On 2026/11/12 05:03, Suren Baghdasaryan wrote:
> > On Tue, Nov 10, 2026 at 11:24=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrot=
e:
> >>
> >> kmsan_vmap_pages_range_noflush() first maps the shadow pages and then
> >> the origin pages. If the second mapping fails, the first one is left
> >> mapped, and the callers do not roll it back. The next vmap of the
> >> same metadata range hits the stale PTEs again and fails with a
> >> WARN_ON() and -EBUSY in vmap_pages_pte_range().
> >>
> >> Undo the shadow mapping on that error path, the same way
> >> kmsan_ioremap_page_range() cleans up after a partial failure.
> >> __vunmap_range_noflush() only clears the PTEs; nothing has touched
> >> the shadow mapping, so no TLB flush is needed.
> >>
> >> Fixes: 47ebd0310e89 ("mm: kmsan: handle alloc failures in kmsan_vmap_p=
ages_range_noflush()")
> >> Cc: stable@vger.kernel.org
> >> Reviewed-by: Suren Baghdasaryan <surenb@google.com>
> >> Reviewed-by: Dev Jain <dev.jain@arm.com>
> >> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> >> ---
> >>  mm/kmsan/shadow.c | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/mm/kmsan/shadow.c b/mm/kmsan/shadow.c
> >> index 0c88d89bf0d6..2166086d3dc3 100644
> >> --- a/mm/kmsan/shadow.c
> >> +++ b/mm/kmsan/shadow.c
> >> @@ -258,6 +258,10 @@ int kmsan_vmap_pages_range_noflush(unsigned long =
start, unsigned long end,
> >>                                             o_pages, page_shift);
> >>         kmsan_leave_runtime();
> >>         if (mapped) {
> >> +               /* Undo the shadow mapping set up above. */
> >> +               kmsan_enter_runtime();
> >> +               __vunmap_range_noflush(shadow_start, shadow_end);
> >
> > Sorry, there is a problem here. You introduce "can_resched" check to
> > avoid calling cond_resched() later in the series (in patch #7), but at
> > this point __vunmap_range_noflush() can be called with GFP flags which
> > do not allow blocking. Before recent Ulad's change called "kmsan:
> > remove hard-coded GFP_KERNEL flags" this function was called only with
> > GPF_KERNEL but now that's not the case. I think you can move
> > introduction of can_resched flag into this patch.
>
> Agree. I just went back and looked at Ulad's b186a94227b7 ("kmsan:
> remove hard-coded GFP_KERNEL flags").
>
> So will do next version. But perhaps it is better to make it a separate
> prep patch in the same series? Because besides this call site, the other
> places that call __vunmap_range_noflush() need to be changed as well.

Agree. Moving that into a separate patch at the beginning of the
series with its own changelog and explanation would be cleaner.

>
> Thanks
> Best Regards
> Hao
>
> >
> >> +               kmsan_leave_runtime();
> >>                 err =3D mapped;
> >>                 goto ret;
> >>         }
> >> --
> >> 2.25.1
> >>
