Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2C81FCFFC
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792180013; cv=pass; b=bVMxWmWEbzCqkWbk3FmCbMS5C/hbJBTntP6Kj5/ysJv4ZcvFvycbUJz4Jonfs62iyL0fBDmk4njxrrLvmOFVR8YTI4uS8ZcAftZ96Bnspr7l+ov5BS0qdv1F+v5R6cUeWrxuqXt0Abh+Ul48OI0mb14c6SZxwWxz09+79Y0gAwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792180013; c=relaxed/simple;
	bh=O8cy62w25lVRLQ2+87Qxso1BD9oGuEcVFUfjG4kL72s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TymlYBJ9wZoddmoO1R27dh1VpEApr2Jx4BoLwtPmZM6aNbwRXVO/2oOsBh8efOOPTElt+xtG058vAM76/WHTNob+BqHCPPH4LhjXjIPU/hDiTTqroXjaeYN3+RAyxWY97+2hQhnU/LHe3hJYW32pflWPWDJ1uM7xJTfG40uFnXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e2zMWSUc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gigmwnwE; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e2zMWSUc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gigmwnwE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GJeZkM2335320
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:46:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p+VxrDVNdVa6yFhA5w5ziLBUXWol4faVGP6JwE2bNX8=; b=e2zMWSUcOWleOa2n
	j79pJlkXPs35DClARNUvq+3ZYiCyMLyeX8gS9qSzUSqbg2xHPzthQ581WM+nMAyv
	3wkTHJUtrzPiIgXv4tZ50WHzIS4K0ebntCICuN4iob0QKtApF1IgW5ET8Gid4zNc
	0RO4EIEWx0BACvUFaEOSoyX7oK6qCjVhTAUTK4O2PHEVNI/EzdifQ8AxOUPet0j1
	Ij/Mwj0z/UA5KReFNGQ5FvsaCLy2dF/2wDFVdCAqRAnAvRt6MmpdjbKrYPFhqeHe
	nP6Y0wt/q6qmsHqK74WIlSFlKZY0JU1lf9lG952eTNB2UACmf0Q1B5s7WQ2y6gQL
	62sGcg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbk3v1ucq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:46:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939c30aa9a0so36166585a.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:46:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792180007; cv=none;
        d=google.com; s=arc-20260327;
        b=j71xgxdCqifN8p1ryogsgOdNFuyaQ2voeSubVrMAfO4VcQ+jwc53+ZGi2gpw16XAhE
         6qHS97JSrUmzoS4otBFEcEqFtVcRVldEoqY2bpCh2zdCPsU7/Z9UytE0c4k80TjkdShj
         8rThuNrfQU8JYhYaS4GjqHTaLUkwGOB+5p087GFHyuOX4mk5roCjMIxD7nw7Mwkt9Q5q
         swtDNMzEAI8TD3bxgqGcYujwXDWxacIzE+qztYHSBN1wO0Cs/AXnfWN1/ErILwCFcL56
         3bJfSJC4Ti6pQOySeycrunxDgsMM8rTlC6wGEI7DDzuwhXgdWnoj8TjV6CL045PeyxHB
         dqBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p+VxrDVNdVa6yFhA5w5ziLBUXWol4faVGP6JwE2bNX8=;
        fh=RsF0LRdeHVTGB+KmCdE0/uAZMGz88Jywl6K97uXhdRU=;
        b=KK4c4nFiz+a3Z0khTSvnoON9rzDkJJp26sXJ02pi9TEMMVppVs7HSZ/ADhVEqGBQHs
         ZNw9g+OsRgSKl3U0w4meXPtnyU+sDJ+lzVWX8tbH4tTifeGW6DQ2z2GCOQlf9ryUK51i
         Js/SJbHl5GXy6Tldnr64A0hlVJuRukysUDF5ki+aG+cL3RhLUCYDRAYsOCmQueFDRSYp
         5y6ffiWhb3UED1ekAjAaLXCNN48knD02djMdWlwlbLRCCiLOgK4+oEiDkw1p6+gYNfKt
         MsooIq2FB76CpEP1nqgsh+1F9+XSZU+MwnIuoBn7Uhsb2OEDVFs7VTnvg+z4J1l/BcN1
         /f2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792180007; x=1792784807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p+VxrDVNdVa6yFhA5w5ziLBUXWol4faVGP6JwE2bNX8=;
        b=gigmwnwExWWkreRuGFmLnelG49DfEVah6iT9Q/+184w0Y0ZqWPlTit2M/X8ANYo7W5
         lJRhv7Y0UcBGhk7FPTn5Pw0hXaUn0Nsh/7R+aPgk/XogdmhUSYgk1Ml+RnH7JGtrUE1l
         ID3AxPmvGUWZKg5MH3XkQeWYwNKMgCosNFBvGyKNM0w1e2v24W7q819imp3ptdKDb7zP
         DcVWHmPSS7OJV5P0RRiFoeHxTT1oU769NP8SEv5rof/0OGBbGB9MVfXFeReB9GIo8qrn
         8Cu3gAxQHS64xUBu9ynl+NPLZp2D8UKb4u5aiMj4D6xCU2+giv3cxd4INBDq6G3uylNR
         IdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792180007; x=1792784807;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p+VxrDVNdVa6yFhA5w5ziLBUXWol4faVGP6JwE2bNX8=;
        b=SUMlSxL8rnysDi6V+er8wVYFQgWvch4hg5CNTe9Vzk9xA87lJC30KlcIpG1W1ihwm7
         yAzxVgoK0MzWMry577uB4lCkS2LSIiq6y62uwPvd7FgFPchn/6cbTOyR5jbHkFQaYtiU
         T6e61Ess1Z+mwgaTIaYhhR5oafc4r3nbjtERuGzmPnJN0ehN+9YcCsc0JocV++7ZQp3A
         1EeGhhEIgBv5fFhoC7qIYqoDisGHExNo5+27I4FmkqzGOCvNUSqCmkH0KwKWgCByjXgE
         uJgJsQ5jjIESBPbcfpfR3skCxlwPrfzZXiXUDy/FGvsy4wF1q48ne6M3Rnc8Y65Du3/C
         eFSA==
X-Forwarded-Encrypted: i=1; AKwUvBxuktcLBgGFner97Qo0KN4MPBNlcYJ89J8AUFB2Vh2SKEvJejJpYB+iXzcqAh81DwhiWqd0cRaFrVvGnck=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3qoqHOq9f87W1usl9aLjICfWrqsucIkoFRm7wsLVTIqsdD9Ev
	FxCcpS6EITwvSvQgD1td7OSKAz4PvhUDxba87USH+AU5rRGOATAHapMQv1bTf1pzYnBxi5RTC3s
	EzF2DwtE3pj2X+NJZ4oL9D39Uau1CAxsnsXNkOJP3ePflvVu4IF2tbR0oFMFWMHZorObR8W98T+
	/AmZrlkvZ+vcZGia9gJRoDjk+9BRbOTp4Mxsr2IzW9gjKpdpJJNxLQ
X-Gm-Gg: AYBFou0f9/9Yt8LTg+87FNZLXccQCsRuz5m6TA6wKVtQYGIjWJuCX4Bk8qzlqCpJJiu
	aizVKv0/pNkgQuake1oSN2G7O5kZE73/gcOLj4ltxCuljxzRx+cAuy7SkKmW5ghnTptEy6u2Q6R
	Qh1IVQ0bj7FhUuJTlnQAp0+fQhll5vTRsELDBhEfMnHKmkW+WeJauQEXi1hfQQvy6QRBTe01rLv
	AlZFV4nIsTqUUWVjm7aP0asJuPcl5VnDwJkJz94hWL3MCOlseHeKMkXKR+iJxRVYkjZaCR2nz8=
X-Received: by 2002:a05:620a:1a28:b0:93f:94b:81ce with SMTP id af79cd13be357-93f29df9e9cmr154471685a.81.1792180007143;
        Fri, 16 Oct 2026 12:46:47 -0700 (PDT)
X-Received: by 2002:a05:620a:1a28:b0:93f:94b:81ce with SMTP id
 af79cd13be357-93f29df9e9cmr154454685a.81.1792180004914; Fri, 16 Oct 2026
 12:46:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013183500.261229-1-peter.hunt@opengear.com> <20261013183500.261229-2-peter.hunt@opengear.com>
In-Reply-To: <20261013183500.261229-2-peter.hunt@opengear.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 21:46:33 +0200
X-Gm-Features: AclHuK-CR9XEUZOvZ07wl9FWbZnEXYQmRoc2w77oysNymiE6oO9QzUKYzXBBsJY
Message-ID: <CAFEp6-2jxY3R3FWm9oWJNtJ3zLfRkEDZ3pxb=T8qNnNLorASiQ@mail.gmail.com>
Subject: Re: [PATCH net-next v10 1/2] net: wwan: core: propagate modem control
 signals to port drivers
To: Peter Hunt <peter.hunt@opengear.com>
Cc: ryazanov.s.a@gmail.com, Daniele Palmas <dnlplm@gmail.com>,
        johannes@sipsolutions.net, mani@kernel.org, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, netdev@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 0MofJ7a0x-5q96p8yYzW1T-1c6kSfl2w
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA3OCBTYWx0ZWRfX9qyNc3bTD47O
 aLr0WCwHXGZssg3vTRwFTydcQb3ZesAoOnaYe6vOdsiBC/dB60aeTw1wAwSzv43NsKPxJdRcdGc
 lqlZU3hpELqoPy15uxOnaUcwEJput8c=
X-Authority-Analysis: v=2.4 cv=BZdNQbt2 c=1 sm=1 tr=0 ts=6ad27f28 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=t2vznHeBAAAA:8 a=EUspDBNiAAAA:8
 a=qh7v8B4ApeZPtt9jo1oA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=V_BghkRpYkFyHJIZkSH6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA3OCBTYWx0ZWRfX1BiChRAFFZ6M
 l6iw6RTVnUIn0MJrDLP+J4HfjShZLwiWm79Qr6TBuJH4Og+mem04IX/BoEOIJ8TwIMcfEAGN18E
 Wq9+Oq2KGuzN0VhkIW3X2xn6zZJ5wapMuR1fqPwZhEe7EUMutAYaaDzvcBVipwDQ2SWlfNJOhVF
 oSHUEVGusOe9I8RgQoK4Kcg++Ijor6Zunh6IqNuSg/7Sn37djwzMWJ4mAfl1y/jzZE/SrLZzfPY
 izsKi+1QfUvnURR4r41aWpPG9o9UN7cIB4Eh3ceYmo1IXuDhS5RXGx5uYul3lNiZNiFY0TQQ4mu
 NshgQz1qoJwIqKNT6vvXEhOjBwk1O9wTQdIqGpaIrBuLgJ9NFNEsWUYxh9yHVI5j5UyWRNuHj8h
 QBQpzXScLbhCQ1r7MvOywdKZVJL05VXcyl1NQD/wS8lUdDyoiAc6BHvl3kgTZ7XbHorPPF/JYn0
 NQu9XfBVKpuYj/a05mQ==
X-Proofpoint-ORIG-GUID: 0MofJ7a0x-5q96p8yYzW1T-1c6kSfl2w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160078

On Tue, Oct 13, 2026 at 8:37=E2=80=AFPM Peter Hunt <peter.hunt@opengear.com=
> wrote:
>
> The WWAN character device emulates the TTY modem-control ioctls
> (TIOCMGET/TIOCMSET/TIOCMBIC/TIOCMBIS) for AT and QCDM ports, but the
> result is only stored in port->at_data.mdmbits and never reaches the port
> driver. A driver therefore cannot act on the host raising or dropping
> DTR/RTS, even though some modems depend on it (e.g. they withhold
> unsolicited AT result codes until the host asserts DTR).
>
> Add an optional ->dtr_rts(port, mdmbits) operation to struct wwan_port_op=
s.
> Drivers that implement it receive the TIOCM output bitmask so they can
> assert or de-assert DTR and RTS independently. As in tty_tiocmset(), the
> wwan core keeps only the output bits (DTR, RTS, OUT1, OUT2, LOOP) of the
> TIOCMSET/TIOCMBIS/TIOCMBIC value in port->at_data.mdmbits, and calls
> ->dtr_rts when DTR or RTS actually changes, gated on WWAN_PORT_AT to matc=
h
> the open/close raise/drop behaviour.
>
> Also raise DTR/RTS in wwan_port_op_start on first open of an AT port
> when the driver implements ->dtr_rts, and drop them in wwan_port_op_stop
> on last close if HUPCL is set in the port's termios. This follows TTY
> open/close semantics, although the termios baud rate is not used, and
> means individual drivers do not need to implement this themselves. As on
> a TTY, HUPCL defaults to on for AT ports, and userspace can clear it
> with TCSETS to keep DTR asserted across close, for example so that
> closing the port does not end a call on a modem set to AT&D1/AT&D2.
> TCSETS and TCSETS2 now only commit the new termios when the copy from
> userspace succeeds, so a faulting call cannot silently clear HUPCL.
>
> ->dtr_rts must be called under ops_lock, which serialises port ops and
> protects against port removal (removal clears port->ops under it). So
> that updates to the TIOCM state and the ->dtr_rts calls are serialised
> together, the termios/TIOCM state now also lives under ops_lock and the
> separate data_lock is removed. The AT/QCDM ioctl handler only holds
> ops_lock while it reads or updates that state, never across a
> user-memory copy, and takes it interruptibly since a driver's blocking
> write holds it while it waits. Ioctls that do not touch that state, such
> as TCFLSH, TIOCEXCL and the FIONREAD fallback, do not take it.
>
> wwan_remove_port() also drops DTR/RTS before ->stop() when a port is
> removed while still open, regardless of HUPCL since the device is going
> away. The raise and drop paths go through two small helpers, which do
> the AT port and ->dtr_rts checks and pass the driver the resulting
> bitmask.
>
> Signed-off-by: Peter Hunt <peter.hunt@opengear.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> v10: Only hold ops_lock in the AT ioctl handler around the termios/TIOCM
>     state, with user copies done outside it, return -ERESTARTSYS when
>     interrupted, and leave ops_lock alone for ioctls that do not touch
>     that state. Word the TTY comparisons and the ->dtr_rts kernel-doc
>     more precisely (the baud rate is not used, removal only drops the
>     lines while the port is open, open only once ->start() has
>     succeeded). Both from the Sashiko review of v9, still using ops_lock
>     only as agreed with Loic Poulain
> v9: Raise DTR/RTS inside the existing first-open branch of
>     wwan_port_op_start(), and drop data_lock so the termios/TIOCM state
>     and ->dtr_rts calls are all serialised by ops_lock, taken
>     interruptibly in the ioctl handler (Loic Poulain). Mask
>     TIOCMSET/TIOCMBIS/TIOCMBIC to the output bits and only call
>     ->dtr_rts when DTR or RTS changes, commit TCSETS/TCSETS2 only on a
>     successful copy, and describe the calls in the ->dtr_rts kernel-doc
>     (Sashiko review of v7). Document in the ->dtr_rts kernel-doc why it
>     is AT-only (Loic Poulain, Daniele Palmas)
> v8: Add wwan_port_raise_dtr_rts() as the counterpart of
>     wwan_port_drop_dtr_rts() and move the open-path handling there, move
>     the AT port and ->dtr_rts checks into both helpers, use
>     scoped_guard() for data_lock (Loic Poulain)
> v7: Drop DTR/RTS on last close only if HUPCL is set, and default HUPCL on
>     for AT ports. Pass the masked mdmbits rather than 0 from
>     wwan_remove_port(), via a helper shared with the close path. Both
>     from the Sashiko review of v6
> v6: Rebase onto net-next. Snapshot mdmbits under data_lock before calling
>     ->dtr_rts from wwan_port_op_start()/wwan_port_op_stop(), rather than
>     reading it after data_lock has been released
> v5: Change ->dtr_rts signature from bool to unsigned int mdmbits so DTR
>     and RTS can be driven independently; re-read mdmbits inside ops_lock
>     in the ioctl path to close a concurrent-ioctl ordering race; add
>     de-assert call to wwan_remove_port() for the hot-unplug case; update
>     kernel-doc to note the op is AT-only and describe the mdmbits argumen=
t
> v4: Protect at_data.mdmbits in wwan_port_op_start/stop under data_lock;
>     release data_lock and acquire ops_lock with a NULL check before calli=
ng
>     ->dtr_rts from the ioctl path; gate ioctl ->dtr_rts on WWAN_PORT_AT t=
o
>     match open/close behaviour; reduce boolean to TIOCM_DTR only
> v3: Replace ->tiocmget/->tiocmset with ->dtr_rts(port, bool on) modelled
>     on tty_port_operations.dtr_rts; raise/drop DTR/RTS in
>     wwan_port_op_start/stop rather than in the driver (Loic Poulain)
> ---
>  drivers/net/wwan/wwan_core.c | 172 +++++++++++++++++++++++------------
>  include/linux/wwan.h         |   9 ++
>  2 files changed, 124 insertions(+), 57 deletions(-)
>
> diff --git a/drivers/net/wwan/wwan_core.c b/drivers/net/wwan/wwan_core.c
> index ffbcf11e4e68..7097b58dafde 100644
> --- a/drivers/net/wwan/wwan_core.c
> +++ b/drivers/net/wwan/wwan_core.c
> @@ -25,6 +25,10 @@
>  #include <net/rtnetlink.h>
>  #include <uapi/linux/wwan.h>
>
> +/* Modem control bits userspace may set on an AT port, as for tty_tiocms=
et() */
> +#define WWAN_TIOCM_OUTPUTS     (TIOCM_DTR | TIOCM_RTS | TIOCM_OUT1 | \
> +                                TIOCM_OUT2 | TIOCM_LOOP)
> +
>  /* Maximum number of minors in use */
>  #define WWAN_MAX_MINORS                (1 << MINORBITS)
>
> @@ -73,11 +77,10 @@ struct wwan_device {
>   * @start_count: Port start counter
>   * @flags: Store port state and capabilities
>   * @ops: Pointer to WWAN port operations
> - * @ops_lock: Protect port ops
> + * @ops_lock: Protect port ops, and the AT/QCDM termios and TIOCM state
>   * @dev: Underlying device
>   * @rxq: Buffer inbound queue
>   * @waitqueue: The waitqueue for port fops (read/write/poll)
> - * @data_lock: Port specific data access serialization
>   * @headroom_len: SKB reserved headroom size
>   * @frag_len: Length to fragment packet
>   * @at_data: AT port specific data
> @@ -88,11 +91,10 @@ struct wwan_port {
>         unsigned int start_count;
>         unsigned long flags;
>         const struct wwan_port_ops *ops;
> -       struct mutex ops_lock; /* Serialize ops + protect against removal=
 */
> +       struct mutex ops_lock; /* Serialize ops + at_data, protect agains=
t removal */
>         struct device dev;
>         struct sk_buff_head rxq;
>         wait_queue_head_t waitqueue;
> -       struct mutex data_lock; /* Port specific data access serializatio=
n */
>         size_t headroom_len;
>         size_t frag_len;
>         union {
> @@ -374,7 +376,6 @@ static void wwan_port_destroy(struct device *dev)
>
>         if (dev->class =3D=3D &wwan_class)
>                 ida_free(&minors, MINOR(dev->devt));
> -       mutex_destroy(&port->data_lock);
>         mutex_destroy(&port->ops_lock);
>         kfree(port);
>  }
> @@ -653,7 +654,10 @@ struct wwan_port *wwan_create_port(struct device *pa=
rent,
>         mutex_init(&port->ops_lock);
>         skb_queue_head_init(&port->rxq);
>         init_waitqueue_head(&port->waitqueue);
> -       mutex_init(&port->data_lock);
> +
> +       /* AT ports default to HUPCL, so DTR/RTS are dropped on last clos=
e */
> +       if (type =3D=3D WWAN_PORT_AT)
> +               port->at_data.termios.c_cflag =3D HUPCL;
>
>         port->dev.parent =3D &wwandev->dev;
>         port->dev.type =3D &wwan_port_dev_type;
> @@ -679,12 +683,44 @@ struct wwan_port *wwan_create_port(struct device *p=
arent,
>  }
>  EXPORT_SYMBOL_GPL(wwan_create_port);
>
> +/* Raise DTR/RTS when an AT port is first opened, as a TTY does on open.
> + * Unlike a TTY the termios baud rate is not used. Called with ops_lock =
held.
> + */
> +static void wwan_port_raise_dtr_rts(struct wwan_port *port)
> +{
> +       lockdep_assert_held(&port->ops_lock);
> +
> +       if (port->type !=3D WWAN_PORT_AT || !port->ops->dtr_rts)
> +               return;
> +
> +       port->at_data.mdmbits |=3D TIOCM_DTR | TIOCM_RTS;
> +       port->ops->dtr_rts(port, port->at_data.mdmbits);
> +}
> +
> +/* Drop DTR/RTS on an AT port. Called with ops_lock held. On last close
> + * the lines are only dropped if HUPCL is set, as for a TTY. When a port=
 is
> + * removed while still open they are always dropped.
> + */
> +static void wwan_port_drop_dtr_rts(struct wwan_port *port, bool hupcl_on=
ly)
> +{
> +       lockdep_assert_held(&port->ops_lock);
> +
> +       if (port->type !=3D WWAN_PORT_AT || !port->ops->dtr_rts)
> +               return;
> +       if (hupcl_only && !(port->at_data.termios.c_cflag & HUPCL))
> +               return;
> +
> +       port->at_data.mdmbits &=3D ~(TIOCM_DTR | TIOCM_RTS);
> +       port->ops->dtr_rts(port, port->at_data.mdmbits);
> +}
> +
>  void wwan_remove_port(struct wwan_port *port)
>  {
>         struct wwan_device *wwandev =3D to_wwan_dev(port->dev.parent);
>
>         mutex_lock(&port->ops_lock);
>         if (port->start_count) {
> +               wwan_port_drop_dtr_rts(port, false);
>                 port->ops->stop(port);
>                 port->start_count =3D 0;
>         }
> @@ -756,8 +792,11 @@ static int wwan_port_op_start(struct wwan_port *port=
)
>         }
>
>         /* If port is already started, don't start again */
> -       if (!port->start_count)
> +       if (!port->start_count) {
>                 ret =3D port->ops->start(port);
> +               if (!ret)
> +                       wwan_port_raise_dtr_rts(port);
> +       }
>
>         if (!ret)
>                 port->start_count++;
> @@ -773,8 +812,10 @@ static void wwan_port_op_stop(struct wwan_port *port=
)
>         mutex_lock(&port->ops_lock);
>         port->start_count--;
>         if (!port->start_count) {
> -               if (port->ops)
> +               if (port->ops) {
> +                       wwan_port_drop_dtr_rts(port, true);
>                         port->ops->stop(port);
> +               }
>                 skb_queue_purge(&port->rxq);
>                 clear_bit(WWAN_PORT_EXCLUSIVE, &port->flags);
>         }
> @@ -976,92 +1017,109 @@ static __poll_t wwan_port_fops_poll(struct file *=
filp, poll_table *wait)
>  }
>
>  /* Implements minimalistic stub terminal IOCTLs support */
> -static long wwan_port_fops_at_ioctl(struct wwan_port *port, unsigned int=
 cmd,
> -                                   unsigned long arg)
> +/* TCGETS/TCSETS and their termios2 variants. @size is the size of the u=
ser
> + * structure, a prefix of struct ktermios. As for the TIOCM ioctls, user
> + * memory is only accessed outside ops_lock.
> + */
> +static long wwan_port_termios_ioctl(struct wwan_port *port, bool set,
> +                                   void __user *uarg, size_t size)
>  {
> -       int ret =3D 0;
> +       struct ktermios termios;
>
> -       mutex_lock(&port->data_lock);
> +       if (!set) {
> +               scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &port-=
>ops_lock)
> +                       termios =3D port->at_data.termios;
> +               return copy_to_user(uarg, &termios, size) ? -EFAULT : 0;
> +       }
> +
> +       /* Commit only on success, a partial copy must not clear HUPCL */
> +       if (copy_from_user(&termios, uarg, size))
> +               return -EFAULT;
> +       scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &port->ops_loc=
k)
> +               memcpy(&port->at_data.termios, &termios, size);
> +       return 0;
> +}
>
> +static long wwan_port_fops_at_ioctl(struct wwan_port *port, unsigned int=
 cmd,
> +                                   unsigned long arg)
> +{
> +       /* ops_lock serialises the termios/TIOCM state with port ops and
> +        * removal. It is only held while that state is read or updated, =
never
> +        * across a user copy, and is taken interruptibly as a blocking w=
rite
> +        * holds it too.
> +        */
>         switch (cmd) {
>         case TCFLSH:
> -               break;
> +               return 0;
>
>         case TCGETS:
> -               if (copy_to_user((void __user *)arg, &port->at_data.termi=
os,
> -                                sizeof(struct termios)))
> -                       ret =3D -EFAULT;
> -               break;
> -
>         case TCSETS:
>         case TCSETSW:
>         case TCSETSF:
> -               if (copy_from_user(&port->at_data.termios, (void __user *=
)arg,
> -                                  sizeof(struct termios)))
> -                       ret =3D -EFAULT;
> -               break;
> +               return wwan_port_termios_ioctl(port, cmd !=3D TCGETS,
> +                                              (void __user *)arg,
> +                                              sizeof(struct termios));
>
>  #ifdef TCGETS2
>         case TCGETS2:
> -               if (copy_to_user((void __user *)arg, &port->at_data.termi=
os,
> -                                sizeof(struct termios2)))
> -                       ret =3D -EFAULT;
> -               break;
> -
>         case TCSETS2:
>         case TCSETSW2:
>         case TCSETSF2:
> -               if (copy_from_user(&port->at_data.termios, (void __user *=
)arg,
> -                                  sizeof(struct termios2)))
> -                       ret =3D -EFAULT;
> -               break;
> +               return wwan_port_termios_ioctl(port, cmd !=3D TCGETS2,
> +                                              (void __user *)arg,
> +                                              sizeof(struct termios2));
>  #endif
>
> -       case TIOCMGET:
> -               ret =3D put_user(port->at_data.mdmbits, (int __user *)arg=
);
> -               break;
> +       case TIOCMGET: {
> +               int mdmbits;
> +
> +               scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &port-=
>ops_lock)
> +                       mdmbits =3D port->at_data.mdmbits;
> +               return put_user(mdmbits, (int __user *)arg);
> +       }
>
>         case TIOCMSET:
>         case TIOCMBIC:
>         case TIOCMBIS: {
>                 int mdmbits;
>
> -               if (copy_from_user(&mdmbits, (int __user *)arg, sizeof(in=
t))) {
> -                       ret =3D -EFAULT;
> -                       break;
> +               if (get_user(mdmbits, (int __user *)arg))
> +                       return -EFAULT;
> +               mdmbits &=3D WWAN_TIOCM_OUTPUTS;
> +
> +               scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &port-=
>ops_lock) {
> +                       int old =3D port->at_data.mdmbits;
> +
> +                       if (cmd =3D=3D TIOCMBIC)
> +                               port->at_data.mdmbits &=3D ~mdmbits;
> +                       else if (cmd =3D=3D TIOCMBIS)
> +                               port->at_data.mdmbits |=3D mdmbits;
> +                       else
> +                               port->at_data.mdmbits =3D mdmbits;
> +                       /* Only signal the driver when DTR or RTS actuall=
y changes */
> +                       if (port->type =3D=3D WWAN_PORT_AT && port->ops &=
&
> +                           port->ops->dtr_rts &&
> +                           (old ^ port->at_data.mdmbits) & (TIOCM_DTR | =
TIOCM_RTS))
> +                               port->ops->dtr_rts(port, port->at_data.md=
mbits);
>                 }
> -               if (cmd =3D=3D TIOCMBIC)
> -                       port->at_data.mdmbits &=3D ~mdmbits;
> -               else if (cmd =3D=3D TIOCMBIS)
> -                       port->at_data.mdmbits |=3D mdmbits;
> -               else
> -                       port->at_data.mdmbits =3D mdmbits;
> -               break;
> +               return 0;
>         }
>
>         case TIOCEXCL:
>                 set_bit(WWAN_PORT_EXCLUSIVE, &port->flags);
> -               break;
> +               return 0;
>
>         case TIOCNXCL:
>                 clear_bit(WWAN_PORT_EXCLUSIVE, &port->flags);
> -               break;
> +               return 0;
>
>         case TIOCGEXCL:
> -       {
> -               int excl =3D test_bit(WWAN_PORT_EXCLUSIVE, &port->flags);
> -
> -               ret =3D put_user(excl, (int __user *)arg);
> -               break;
> -       }
> +               return put_user(test_bit(WWAN_PORT_EXCLUSIVE, &port->flag=
s),
> +                               (int __user *)arg);
>
>         default:
> -               ret =3D -ENOIOCTLCMD;
> +               return -ENOIOCTLCMD;
>         }
> -
> -       mutex_unlock(&port->data_lock);
> -
> -       return ret;
>  }
>
>  static long wwan_port_fops_ioctl(struct file *filp, unsigned int cmd,
> diff --git a/include/linux/wwan.h b/include/linux/wwan.h
> index 1e0e2cb53579..23a8a8ee473d 100644
> --- a/include/linux/wwan.h
> +++ b/include/linux/wwan.h
> @@ -57,6 +57,14 @@ struct wwan_port;
>   * @tx_blocking: Optional blocking routine that sends WWAN port protocol=
 data
>   *               to the device.
>   * @tx_poll: Optional routine that sets additional TX poll flags.
> + * @dtr_rts: Optional routine that updates the modem control lines to ma=
tch
> + *           @mdmbits, the TIOCM_* output bits (DTR, RTS, OUT1, OUT2, LO=
OP)
> + *           currently set for the port. Called when the port is first o=
pened
> + *           and ->start() has succeeded, on last close if HUPCL is set,=
 when
> + *           the port is removed while still open, and when TIOCMSET, TI=
OCMBIS
> + *           or TIOCMBIC changes DTR or RTS. Only called for WWAN_PORT_A=
T ports,
> + *           as only the AT (DUN) port carries the modem's virtual RS-23=
2
> + *           control signals.
>   *
>   * The wwan_port_ops structure contains a list of low-level operations
>   * that control a WWAN port device. All functions are mandatory unless s=
pecified.
> @@ -70,6 +78,7 @@ struct wwan_port_ops {
>         int (*tx_blocking)(struct wwan_port *port, struct sk_buff *skb);
>         __poll_t (*tx_poll)(struct wwan_port *port, struct file *filp,
>                             poll_table *wait);
> +       void (*dtr_rts)(struct wwan_port *port, unsigned int mdmbits);
>  };
>
>  /** struct wwan_port_caps - The WWAN port capbilities
> --
> 2.43.0
>
