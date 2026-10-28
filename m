Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793222162;
	b=3xcEPRRtdgfm6pFl4F2h65hVUfR4P9Db6PSeOd+Evp/Tc9UVlEzUMsBKBU4oEWA5rT/x
	 jALGq1quVQWoTne7HGQgbJKFr96XaI9ThCSVjQVlefsPw2w10ftJotyIMO+EC3kluZMWR
	 yzjVlQBt4CIfcXK7htprVHtc2z3ZutsUCjOD5F2zht6xlhz/m5dSKJZHl7D+Yp5G5+m+x
	 5HqxB2Y+9aINx7xN5mmthYftctuuKdiFKZHnqcQhiETMuuqhigL+ua53XvMKh7mktrGaw
	 6TQ6fP1Li95+6sFuuBEFdu31l8BbVvq+V7ZFwybsyLlZFGLjbHEDL5BYSLbBMTKnynw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793222162;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oauWwuo3sq11cnobSj3VTm4NBr/q5BT3TXemChVykp8=;
	b=J8jyBWRxMTCejTk7l/rBtvm/Ldl5Q4xVLwPIkglfuJixRfiE0WTEURpdfuMkQV2L9Q0Q
	 ITECjeVtsfNdJ3yWwWHk+MUooxS/wjfEbkgAMpaywxzX9eLx8j9XR6Ago55a+Y3zcMOAp
	 ivdtGucga+hnsDQCQ8obX38mSn5i9Na3MwreNdMFR9KC4fqY2qd6fl8/TdLYw0w62mtPn
	 kgbngZnF2cc+CI9+IMV3/w1UZmaihrYtvG3HfqmL2mtb2JBbJ6iTKAwqmwIlBa+D4tmWJ
	 nhV1RjQEiLcTXq6sV6C2aTlmEfL5V0GAhnJJ3WCY+B0o1bLjPkhuZDzkYg9wDTd3GAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="adh4sY/B";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FB9606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:16:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16FB9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=adh4sY/B
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3282db206d3so1479133eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:16:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793222161; cv=none;
        d=google.com; s=arc-20260327;
        b=H1BwxZxgXlvJ7E26tseXoZyK449Jj1C0P8PQ80rbg09/fFf22u4BiHzLmtmGFoLzZK
         V5PAJBDx89yFhTGhW4tJO1Ir3B1WU493PfL36z90ykxR6qWIbvKQE75/hM2o4zYto7sw
         bsfM8E4Sw11FsFhj4xUwmBiKhsJBkmWcHW2LugkSLJnYuqtcSSYoRbLUm3iQxBmTi59O
         Mraaxl2grli3Zmat5+cdfNhG7C1L2/+h3y/el7J4SfsuCs0be7jmzmvuU+Yfd6xxtzYr
         ROPNREXSwSjjGv5GIdZOCdZLeJMy2YCz2n4H00od/EqjvJXlmXlXz5qpVZpSmg2CWjgt
         /mdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oauWwuo3sq11cnobSj3VTm4NBr/q5BT3TXemChVykp8=;
        fh=xkat6rGzAF6urUtcaO27Lf0WwxSCfNIF8J19BHExmXQ=;
        b=g+6LulQXnHLMVJQxWldF/kK/9GHFICOiRGrcIy3eAjYr+e5zAgDqfXtD+DYLw8Ra5j
         diC4KoXlEQu1Fnafh0rOPYNF5VK0nQbrnATlt01pxYAVL1rzmlOYk/wgTOxE+ggBYcoW
         hvlrOtb7dq5swgVm+y2mwP6U6wvWVpGIfhN6jAvsFR2h3iI/IlDilTO12aguxu8wyaQd
         iFlgSZxswQioy+npYmbMz6zmU4prUMMu+PD4qIRW6K1IXuywmKiR3w4uYFmwK0+g/BM2
         8roEjfPMXzbbNgqfunLc0Ndt35hV14LiItV07npL3c5fX8NeCQdsDZ5ZeKeRxrAZbMiG
         v3dQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793222161; x=1793826961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oauWwuo3sq11cnobSj3VTm4NBr/q5BT3TXemChVykp8=;
        b=adh4sY/BihBDl9ZnCIoeNm0gMvfJrtwFRCg6DYeW/dBEuSrr0L3HMFyfHNZ2bFag6X
         XUD8y7VcFzG9Z4fibELC4c1GlxorjVpD17MwjJA/o/zTda4Zn/Za+2B9G7+/QVbauqcJ
         gzuqEx5/1Z/i2JYS0K7lvIJMp1VM/6dwAMb2B4lpK9ne7XzmTcoJxa+8gu8D+DhvzE5m
         eHCZdVMiFdkcTXLqlpjEinwf7fX3B9c9hd7Ze2Ckl7sloBCwEGNMY9SApCcbScYxzp4B
         R+cR0jgpJ1A2eCqLac0CVlJatX2pmqErddDqhFEMW9eojskm6gbq5zVWCphTZdzl71nu
         qpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793222161; x=1793826961;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oauWwuo3sq11cnobSj3VTm4NBr/q5BT3TXemChVykp8=;
        b=EBT+BWqqO1k/zjS452G/o+GyJ1mSs2KWe7iTgHrZUMaoHm+r78SAV2wMgZCQ6Rs8VD
         D5wPLhaYOvffmz8nEP3Vep1Gft1hz36S/u0hGaYOR5pmtADwEXjgS5XJRuApbTLIWlHx
         mQ+VsAnj2KLUJ1h0NV2CSnF433KPWC+lJVBRnU4SAGvjVC8Rs5QCfSWaDrMz7htUqsvD
         sswYz/5H7rvzNgX/gFszIZ9JeoAXrg07LMw80XoeTtT7ogcdFmwVdig5O5Lm7Uy38vQ/
         KksrB+eQF4URSUwnun/ij7uN3tHWCr/pO6twMPLtcE02phBDXCVoatKR/yDt6eka7c+O
         rCkg==
X-Forwarded-Encrypted: i=1; AKwUvBwwOvAViyEWhK4E2dK6vkNZdp47peWraX2Er+4q5/coksQYSrP6jMeHH8HE1JRzckN3rdkjRmELivy2lHg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxwy3SbjNCF27SMcK2Fsgk7Y+c7yUZRgf/+rtB6TkL3GwZBudw
	1aKGW6alsr1xY2v80pilKenMdg19r1QFjywkek2Xyn+y9aTdnPJ4JJij0bfqD3LqCZlZCOuTACs
	vpw36t53oqjZwGusOhEV49YCg4hkvQA==
X-Gm-Gg: AYBFou06iEva5xCrRbeJe7hODek7wHpDMTf6zni/K5qVDTRp8VC2FNBoRWj24ct/EqK
	ZzZ2g4sGId+QdI5pOWpb7r+TbPfm8R2F5+kNnar8qXUIRrnMxNGwZmm+4B/gFFLsqjLi2S0n1cl
	5mS615m3FTFbu9iAcvOXvkLL58MWomvLDu/SpLN2ilWQoWJ4Kvbxx4q+8ktLHO6fyetAPy4bT0r
	RpiJzohVDzhn8CTmO2MWetR2hIw+7J8LFcFCeKMlc5bPuvpoWFZL9wJ07WPkviNsT36FTdAP52O
	UBkotgPEY26z1org8j9xQHRw+6/5h5rX4ubaB5fTq+JWrR10yuFfludlw45ggcRCly4fYovH7SP
	kFtpijtRzBcWH4ffMsBCYioUmXI5290V2PqPSINz/c6Q6tndc8YyCgU+QXiocqrA+qnpTjrDhxe
	6ImFO9I0zfywk5pOT2dFYCdhRsZflQamIGFDGqhV7talM=
X-Received: by 2002:a05:693c:4196:20b0:35c:85fa:5a68 with SMTP id
 5a478bee46e88-36a2043f09emr5672581eec.31.1793222160949; Wed, 28 Oct 2026
 14:16:00 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAM6_QD_PoTdwdM7DvzzgHRs-G5EvQu-c5oNGve=GuKV4wFYAvQ@mail.gmail.com>
 <CAM6_QD_xAyTFVvYKvCrrZmS+fV5DBBje9V=VdkDMMSpt2ussRg@mail.gmail.com>
 <20260928120343.49e02c07.michal.pecio@gmail.com> <CAM6_QD-CbYSsmic5LhpMi-aMXuC_VaniELBzaBeWO8SWm4UONA@mail.gmail.com>
 <20261002104355.698eaf00.michal.pecio@gmail.com> <CAM6_QD_z7eT+N6HieHyZhPmXqPxKqeSYKX8OK--M+rN2VAsO_Q@mail.gmail.com>
 <20261013232506.1b4dc340.michal.pecio@gmail.com>
In-Reply-To: <20261013232506.1b4dc340.michal.pecio@gmail.com>
From: Dane Linssen <linssendane@gmail.com>
Date: Wed, 28 Oct 2026 22:15:49 +0100
X-Gm-Features: AclHuK-0VicXLDxTTXOZVAVA0jLm6XDOFQTVAWvpnubu6rlMFZRY5jSdjuGEnKw
Message-ID: <CAM6_QD9NDbVESP5peiNhfU5B_7UmvKVLqNz_85A_GABwDhabiw@mail.gmail.com>
Subject: Re: r8152: RX stops until rebind after -EPROTO on the bulk-in endpoint
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	Mathias Nyman <mathias.nyman@intel.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org, 
	Hayes Wang <hayeswang@realtek.com>, Chih Kai Hsu <hsu.chih.kai@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

> Looking at the log below I'm not sure if it will help.

Agreed. All four soft retries failed within about 14 ms, so I'll skip
the retry patch unless you think it's still worth a try.

> 15 ms is quite
> a long time and my gut feeling is that a temporary link disruption
> would be unlikely to last so long and not affect TX, unless TX is idle
> through all that time. Do you still have those usbmon logs, were other
> endpoints active in the 15 ms preceding the first -71 status?

The pcaps don't reach back that far. The watchdog takes them when it
notices the stall, 8 to 33 s after the first error. In each of them
0x81 completes only with -71, and 0x02 and 0x83 complete with 0.

What I do have about the onset:

- xhci dynamic debug logs every "Transfer error", on any endpoint.
  Each burst starts on ep 2 (0x81), and no other endpoint logs an
  error near any of the stalls.
- Nothing else is in the kernel log in the 20 s before any onset:
  no carrier change, no USB event.
- Traffic is sampled once a minute, so it can't show a 15 ms gap in
  TX. Averages in the minutes before each onset:

    10-09, 4 stalls   NFS copies, 25-40 MB/s each way
    10-26 19:31       250-480 packets/s each way, under 0.5 MB/s
    10-26 20:19       1.8k-2.0k packets/s each way, about 2.5 MB/s

  So heavy traffic isn't needed, although the 09-27 and 10-09
  stalls came under load.

The onset is the same in all eight stalls logged with dynamic debug
(10-04 to 10-26): four soft resets about 3.5 ms apart, then the hard
reset 13.6 to 15.5 ms after the first error. After the hard reset the
-71 completions keep that pace, about one per 3.6 ms (~275/s). So
each soft retry takes as long to fail as the transfers after the
endpoint is out of sync.

Since my last mail there were six more stalls, all with virt_state
0x40, each fixed by the watchdog's rebind: four on 10-09 within
20 minutes (kernel 7.2.7) and two on 10-26 (7.2.11).

> The other possibility is that a HW bug gets the endpoint in some bogus
> state and only resetting the endpoint or whole device can fix it. Maybe
> resetting the RX endpoint would suffice, and the driver schedules some
> work on -EPROTO where usb_clear_halt() could be inserted.

I can test a patch like that here. Since today (10-28) this host no longer
runs cluster workloads and the adapter is on another USB port, so I
don't know how often it will stall now.

> Question remains, how to get the chip to abort the botched transfer
> and start a new transfer into a new URB cleanly? Is it enough to keep
> submitting URBs and eventually things will resynchronize? The driver
> seems to believe so, but does this really work? It will need to.

Without a clear_halt it never resynchronized here. The longest stall
left alone (09-27) still read virt_state 0x40 after 15 minutes, and
RX only came back with the rebind after 23 minutes.

For the Realtek side: RTL8156B, 0bda:8156, bcdDevice 31.04, firmware
rtl8156b-2 v3 10/20/23, on an Intel xHCI (8086:9d2f) at 5 Gbps.

Thanks,
Dane

On Tue, Oct 13, 2026 at 11:25=E2=80=AFPM Michal Pecio <michal.pecio@gmail.c=
om> wrote:
>
> [Adding Realtek people who contributed to r8152 before]
>
> On Fri, 9 Oct 2026 14:23:57 +0200, Dane Linssen wrote:
> > > You could try it. We may consider increasing retries in mainline if
> > > this turns out to solve real world problems. Though so far, in the
> > > only reported case of 3 retries not working, 10 retries over a span
> > > of 100ms weren't helping either...
> >
> > Thanks, I'd like to try it. It needs some setup here first (signed
> > modules), so it may take a while before I can report back.
>
> Looking at the log below I'm not sure if it will help. 15 ms is quite
> a long time and my gut feeling is that a temporary link disruption
> would be unlikely to last so long and not affect TX, unless TX is idle
> through all that time. Do you still have those usbmon logs, were other
> endpoints active in the 15 ms preceding the first -71 status?
>
> Absence of errors at other times suggests that this is not a case of
> barely functional cable causing high rate of USB packet loss.
>
> The other possibility is that a HW bug gets the endpoint in some bogus
> state and only resetting the endpoint or whole device can fix it. Maybe
> resetting the RX endpoint would suffice, and the driver schedules some
> work on -EPROTO where usb_clear_halt() could be inserted.
>
> Question remains, how to get the chip to abort the botched transfer
> and start a new transfer into a new URB cleanly? Is it enough to keep
> submitting URBs and eventually things will resynchronize? The driver
> seems to believe so, but does this really work? It will need to.
>
> > > Any results yet?
> >
> > Yes: three more stalls on the same host in 11 days (09-30, 10-04,
> > 10-06), all with virt_state 0x40, each recovered by the watchdog's
> > rebind in about 30 s. Dynamic debug was on for the last two. Both
> > start with a single burst, and in the 11 days there wasn't one
> > "Transfer error" on ep 2 outside the stalls. 10-04:
> >
> >   22:36:09.251 Transfer error for slot 4 ep 2 on endpoint
> >   22:36:09.252 Soft-reset ep 2, slot 4
> >   22:36:09.255 Transfer error for slot 4 ep 2 on endpoint
> >   22:36:09.255 Soft-reset ep 2, slot 4
> >   22:36:09.258 Transfer error for slot 4 ep 2 on endpoint
> >   22:36:09.259 Soft-reset ep 2, slot 4
> >   22:36:09.262 Transfer error for slot 4 ep 2 on endpoint
> >   22:36:09.262 Soft-reset ep 2, slot 4
> >   22:36:09.265 Transfer error for slot 4 ep 2 on endpoint
> >   22:36:09.266 Hard-reset ep 2, slot 4
> >
> > From there it's Transfer error + Hard-reset pairs at about 275/s
> > until the rebind 40 s later. 10-06 is the same: four soft retries
> > about 3.5 ms apart, the hard reset at +15 ms, then the same loop.
> > So here all the retries are spent within 15 ms.
>
> After "hard reset" it's a 97% chance of endpoint sequence state being
> out of sync. On USB3, resubmitting without usb_clear_halt() is futile.
>
> Notice how baf33d7a7564 ("r8152: avoid to resubmit rx immediately")
> only talks about disconnection and not recovering from these errors.
> I suspect no one has seen such recovery, at least on USB3. Easily
> recoverable errors don't reach drivers due to retries in HW and SW.
>
> > usbmon, 2 s from each of the three stalls: every bulk-in (0x81)
> > completion is -71 (571, 553 and 551 of them), none succeed, and
> > bulk-out and the interrupt endpoint complete normally.
> >
> > The other host with the same adapter logged no transfer errors at
> > all in the same 11 days.
> >
> > Dane
