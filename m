Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794525393;
	b=p7qT9/vRF0t77Sjzqw4FnnCKr/0V4NAaMBXtzoNx2y+dvQAGKEY8SQqcnRU2cZZZ6pOq
	 LCpG5YVBmLH0EyrHC2Fpt3IJex20EpdEoQSyZ5AogU6IlelYWFA+fJ+B9S7juVVlBOw/r
	 Jzm12WwGZgKnFYNw6OpYeFfp5EYKgxKfrj9OeQyTPmZjwskfWOrVCxR2BuL3QZSaww/wA
	 H30/HGm1VQCRZr/3p9Ir0/MdVTLclM1hMOTglPkBh/b8Q8bmGC4hzhjux6+AqKr7VJNfG
	 5Hf7sRahNu1a0M8uemtlsTR/kfMPMQSebLckMyPpu5VorUoBxsX3KpDREqFUFbu+MnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794525393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YCt6YKhP3iRu11RrkHzPffGw1/WrazJq8WC9GVsXVNQ=;
	b=0PlHthJ2FU3ew1ihnMS7ZjwOwfWIavifVbVaylVXNixaIbng+9640TJ4ZE+Y3Ie2Bpk4
	 LP8ep9Xx8UDzWZGgh6ZjwqkWjLKWYa1KE7bhPcE9UI6eItlifJYbiKlJdkHCMozCV/TAf
	 9fqMQ3zvneSzOO+VTag2f08Ozew3eR+jTG8HCYazxIB1U+IK1SrEpSyzF8pLbAgHICbep
	 kY61z5oCtG9POfsUaeFWN8FlNEwhLEegjyhvVg1eNDBqGwUYG/fO9jBQ4lSfTP7OMVgST
	 StNZbMnlBRqoG6tR1OrwsCb2Lgwa5rd/bnOENxW7Tcg4fH7QKPtyJSsOCS/5ynwUp5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PcqGLabY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800F2606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 800F2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PcqGLabY
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1931ff67a29so77589c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:16:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794525392; cv=none;
        d=google.com; s=arc-20260327;
        b=P2lWKN6Qc72TcFFmZ0dXOuPcbadYwekgxIkW3+BMBHCFwzQvPg/gmG2a1M8jmct/I0
         GA2YAQsdvDBsf1W3cSgm4ZZEDHvm11oT3vPj0xj0/M6vOSrTZKFwoWtqiZvwE48Nf8+o
         MjpXllDziPf+j0RajXX0qTAeoKrmHMhRr6XytE3MQFCq5O1/cWczziR4yoAuaTxPSmn8
         vRyqqmyOsZh+yNkKnDOU1O5VTkHo0kDVVO7uZO2r5/+i6Cbam+/soYetLmiS6l942wwl
         zWtq/d0aqBnyKcvTrcJ1Hr6DwPe46JeRs8W/arIOhIhrYVirU2IQhJDKbS91xiUXHBpr
         /nTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YCt6YKhP3iRu11RrkHzPffGw1/WrazJq8WC9GVsXVNQ=;
        fh=zYFXQim7oAAr0k6JjnqO5RBW1dekwk87OiZhI1VQURs=;
        b=dxbgIcjLbaHmKYkunFKdaI7+xeHBQ3Fy7THzG7XVeM+LFCilzl13Z2+OC4nkSLLLhc
         v+RSTx1N51PWJuceELXhYmyctgOM2XrlBzM73HTvBSLTI8iURa+rWYageWVQOaYfvjoh
         FVHy+VikbY2vvl743ju1JMIJC3W88F79uODXNdsrfqsMZC7PD/xpJKgnMGiNwQFuvmKF
         f+27Pt4yEd/RPHgwrE22j7CnrF276jdc9qMl8vRJx0YziMYrcclTNGQFK0XZx95R2tF1
         3EDpvQ0vwtgiGmI/TQBY9GBRP+2JS1czRzI+lgXX5E8IJ/P7wHq7yYKpMkbeACX3t/6R
         NVXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794525392; x=1795130192; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YCt6YKhP3iRu11RrkHzPffGw1/WrazJq8WC9GVsXVNQ=;
        b=PcqGLabY0qbX789utrbySNOrwQkNq2cB4pnsRIKpK69t12rvdji70sLBSBoeWWVn2s
         4wnlfOP61C6XJ3rRbulB4DxM+EKEpAsxUQSo2JA+aAxYWOoz1mPZUVZ7hYAoMjCqdJ+Z
         YlyR+c9G5ag0Zg2wP6Nd9y5zd2mDpQKWmwjvn5+gtyobt8SMhU21EB+Kqx+vQWXNATGA
         hG1zf6G5Ug69yuzP41e4rRz/RSKQwhpyqDt89pV90Qf0CvqQ79O/x2glhFYtrJhRgsyV
         dsgoM6sFjo04BhvOVgBFhX80gl5mDmtlPjqNuMYlfNz80/eO6cLtmjg1rj1qtj+qOvm9
         Un7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794525392; x=1795130192;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YCt6YKhP3iRu11RrkHzPffGw1/WrazJq8WC9GVsXVNQ=;
        b=EgZzFmvx9vBLpgdKBD69btliLU0TAUMnsqfjrFfq9yIlUENa8DSjFfvKFlYAckKl3c
         Hmy/sMB1fo5HVLGsk8GugkE0xQemR2xHP4y9lsY2tforTw6YUV+JHHYNI3Vtml3zpFp8
         pOVnr9QvZeeNHNfcnh15tgHqtOn+o0UGBbUUKaYJLLxcji27qGyYJDU/OBRNg+gUCi9U
         ovnJWJrlCckBJHLULIzpiCzJU6dJi+s1FyL0vzsKI5B1ijx6D16QrAbRg2B7lLR5szj0
         2bflsaZ04QvV4vBelnMq7pp792P+0AgSpBCyAVYhu6oCqM1U2Om1qMl9iAXaVnk9lOB/
         qCKg==
X-Forwarded-Encrypted: i=1; AL+hErHZ8a7A6j11oTyy7n5x8vKS9BId+CoxrOpACo9gJKCMmWrNkTljVlhlqqpk3GfxbergdPHBkqkdOXPJHNg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bEfsq7quKG2BGw5hPM4vz4OYGLz9AkwZBFyHG9E5rGN/5Y36k
	CxtkhJBOv3CnyF4TBFb7Qz3NePlLiVNQq3so1tb1Z54EXen3Fz1luQcOtqZ+0XZtXBkcMxCr01d
	Do6gxXpsfVIOWjPA9WAtq6wwcROlxk+k=
X-Gm-Gg: AYBFou1aKQLo/w0KsmiLYss0TXvthv24ug5pT8ow1fjAFz4NLtne97mOHII3RInh969
	Yh1kfcCKvbXaiM4YpDJZsbeqKzQlMOxEs9JwAoQ7404lCNgKyNVi0/Gq6m2Rs7Enkf1lqrewCkI
	07Yt5ogJbFwAMjkKhxqcbmJaiAXwVo4GDt86eCjoeOGYGO2JJW57NSfogaEFBC9VNylHgPwSHmi
	GsfgxeyLHr4ha2ezj2lAOlxXBhDtNaAKV6BVE5U++gyL+nYG2LT1EOG3vfrx4XGdwOXccO2oQ4f
	oHBl8eqjJ9SWdwpbEpaXuh+SYQRX/rlA2Ju2s3e5IUWG9kS2LMdtPe188k3acamLIX8p9dqAq2P
	6Zy+j2GmpiADR7gPqSMa3Fui43HAWGRHD4U1sl+rmOsIdxGAh2sELprJj2OA64ugzFUt0AUqF4f
	fUayU2HxybHtO3ZkKJM4N1SBIF3JmnuJsPzAd/evgWH9Dozf6CjDx3Iw1o1xxY/BeOJTRNtqkwj
	gT0Az1vtVe4mlOMKhNVh85F3UVhgSPpb/QYGupX6b0MY1eDsX9HaY4UUSsc
X-Received: by 2002:a05:7022:2584:b0:196:d6e1:108b with SMTP id
 a92af1059eb24-1b5030e32e2mr1199073c88.10.1794525391639; Thu, 12 Nov 2026
 15:16:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021000338.2160223-1-miro.kropacek@gmail.com>
 <20261021022336.2232886-1-miro.kropacek@gmail.com> <c77944ee-f170-ce57-9065-d7d49fcfed6e@gmail.com>
 <CAMuHMdXWHXjbCNojoukGq4OWvLSibk-goJo4quLdbOj01neOew@mail.gmail.com>
 <atqTLxkEusWSS-wf@google.com> <CAN5rfbQWDTXZVyh8fDjxqRVO_HEKvWLC7Q_i-7aTtSxi9sWuSg@mail.gmail.com>
In-Reply-To: <CAN5rfbQWDTXZVyh8fDjxqRVO_HEKvWLC7Q_i-7aTtSxi9sWuSg@mail.gmail.com>
From: =?UTF-8?B?TWlybyBLcm9ww6HEjWVr?= <miro.kropacek@gmail.com>
Date: Fri, 13 Nov 2026 09:16:15 +1000
X-Gm-Features: AclHuK9omy7qW74EtahCV4gmD-m_X0i6pDAOWe6bsljrf0RlmsCYb8yPkvkcYRk
Message-ID: <CAN5rfbQr9wjnAZN4fitmCyZs_CGd0A37omicP3hfiH3+_SWahA@mail.gmail.com>
Subject: Re: [PATCH v5] m68k: Fix atari mouse movement
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Michael Schmitz <schmitzmic@gmail.com>, 
	linux-m68k@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Just wondering if there is anything I can do to get this merged? Geert
gave his Reviewed-by on v5, plus his Acked-by for the arch/m68k files,
and Michael is fine with adding his Reviewed-by.

Would you take v5 as it is through the input tree, or would you rather
I re-send it as a standalone patch with the tags collected?

It is basically the last patch to be merged from my "atari stream".

On Fri, 23 Oct 2026 at 10:21, Miro Krop=C3=A1=C4=8Dek <miro.kropacek@gmail.=
com> wrote:
>
> Hi Dmitry,
>
> On Fri, 23 Oct 2026 at 08:51, Dmitry Torokhov <dmitry.torokhov@gmail.com>=
 wrote:
> > Could you please re-post v1? Can't seem to find it.
>
> v1 went to linux-m68k only, without linux-input:
> https://lore.kernel.org/linux-m68k/20260814031745.17140-2-schmitzmic@gmai=
l.com/
>
> It touched only atarimouse.c, keeping char * and casting the two
> deltas to s8. v5 is the same two casts with u8 instead of char. The u8
> can't stay in input alone though: a char * hook doesn't accept a u8 *
> handler (-Werror=3Dincompatible-pointer-types), so the arch side has to
> follow.
>
> --
> http://mikro.atari.org



--=20
http://mikro.atari.org
