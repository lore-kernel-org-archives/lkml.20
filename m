Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793815036;
	b=dqmwZAQrwtxEikekh0lL7wy7auozkYtxsWxvM3wVzH7v8OfKQ4VqsuRLTYo21Lbmg9Pz
	 UpSJDfR+Sz/O91EdnZsXyKjUDcr+D4OjP4xHb02XPr7n1bEM7Fo8G//CxTY0kE+4eNw9W
	 O/Fh6qAZjQyvTZ/01R/YyNAlfENk4ASarMPakWSQY/WeJcxJZUhWWnVPTDZuheKwbUu+9
	 k/DofnNiYEWwoyMiN5Nn+o7+ba95oNqaPDZ74orNw5vM15S6QspNxp9a3WbiTVYoQha8R
	 /PxzTZYQWKNr/zCFCDfuylQSa1HP5Qf4Llh696IwXZrRxJFX8u3cZfzgLcZk6sraT2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815036;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Fb3Zd3ut8454HotwPwPAYB7YyRUaA3GgbhwCbjm8lMI=;
	b=sXqrWnc9s9h3TaEVv/KVk9hHjWiyeht+uz6UqcvA9bdpgRXMVS2tw1HBnWcswEUW7vPg
	 7r7CqGyomfLGveRVPuASzQcpkckrS1GzINFoNhxTjoq5/7UdrcUuPjAqJE9LE/PeMF3SR
	 j5PAPi31NFXqqBMIOMLD1UDhoPEfmzdHvlcJiU26tOF2G8zI/ilQZFy4EJSjIOSIM46sx
	 i9QHJ6MH9UPujsZhQY2QhPzakBXSMluwDSfYNY2K/g+VzvXDYxIEeowJ6Rph1byBYtbK7
	 +ICGvPH7AWpgB8IvVMPmvI5TrL6SqsujEGXKPQFMLLjZRcBX40BgnXJcGiWw/pilnZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="RQLgT/9/";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="mlAC/jFj";
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9922E607AF0E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9922E607AF0E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RQLgT/9/;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=mlAC/jFj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793815029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fb3Zd3ut8454HotwPwPAYB7YyRUaA3GgbhwCbjm8lMI=;
	b=RQLgT/9/LCYB2tLGWkjNAyspMrh4zk6ZGjOJ+fclDucidd5Wgxed5dVp9c1nL3M5UlkF4F
	+OCuWUo01TVEFCek+Bw5vma3PEmhEEs0Brp3Y16g2Ta9CueoNqP/nuzlqJDlkc0vfqdnM/
	giIkw4fq+vaxWDowTLP8ots0YbPkRQA=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-fkws6BjqNNSdK3bK6o4kXA-1; Wed, 04 Nov 2026 12:57:07 -0500
X-MC-Unique: fkws6BjqNNSdK3bK6o4kXA-1
X-Mimecast-MFC-AGG-ID: fkws6BjqNNSdK3bK6o4kXA_1793815026
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-3ace248a3bdso244901fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:57:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793815026; cv=none;
        d=google.com; s=arc-20260327;
        b=kzhmtOsV1WfjPwJ2dt3pe6NY6rMlIsHuVQjTcJ3XEtqUR9/k0udt8ed20pzElztD30
         CwYcoiB0kOnEixWpvMEPoM7zsfZNH+hzv2mgGntPv0Vr20UBOk5gU7pTWLPKJ6DSjyOW
         hMZ25Wj1VG/sAa93jxdbWpuBNn61VOSzeo6b6tm/dL22fRsCJ2oqqN7/PPHwP0sSUHil
         eXm3vO5BJGftRG2ehO4E69E8Klfba6ofMIB+yhPecX8/WSdSFgz1LDAAz4Q/ikLD4DDn
         BqFHxO1dNpLeQpq7RTcnf78Fghkda4JFQlHkg5pjG0aDKD4EiDKqHnEnUvOISPK/NsyS
         gCjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fb3Zd3ut8454HotwPwPAYB7YyRUaA3GgbhwCbjm8lMI=;
        fh=tgLBa7IOc2WoUTbNyvqgqTuPNPWS31UHiF/yGjOBymE=;
        b=P87is6gazLMGfJnf738GirhN/e8m+5xWsc+eN/AXbhonZxkJ4hlzxCpRLHy7m4+M4i
         o//Wu9CrEDUnipBFhIR8tbBZZ78k7eJgOj1wE49zZhTDq4IrFoDacT16PbfX2APebmKG
         GEly/lh6gdWuaxBh3AB3pr1jhCjC/u3BsJzYKsemqURSu7iaaYpjt8KctpHF6XhS33nV
         ZhOYhlxZ3RtUoTLV8+YU998S8bTPup9NfFqlQ/a6VoFGZLjRk85v1BLlhG3rUkeWSfgu
         0KCUFYx8KtIN6mppbyjn0Lgi0YsocFqP2pjs4Qx47+y2X2lG/Jwm1XAAWvpqFl8owG9E
         YDPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793815026; x=1794419826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fb3Zd3ut8454HotwPwPAYB7YyRUaA3GgbhwCbjm8lMI=;
        b=mlAC/jFjz7oK817vV7DsYBvrbyux9dgwk6qV1AApQ/4L5OV0xk2T4pZBrepTZiT2gR
         MggScLQmHF20PTh2VdRd4nFSOfIGL09xvuPV8v6httK+OlIZGqibynpX5DMCpc/ytxpm
         rV7W2VKOcmevoZcngrouKLaIT185InHTR8ytAO/SmUcCz3ut2+4zOzJeRfwOK7DrwiQo
         1EN6u8ogVIoyVMkqKz/vfZ1MZ49feChmZYgAwNu+USpBGUh8fPIexE6r/J6ZspvTuH46
         WEbEnh3wFKroI0XHXAHX5ir5n2U/gR7F3Z/5r0q8WT/EJXVF9GSaqA9yOR/wF2lQn716
         KZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815026; x=1794419826;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fb3Zd3ut8454HotwPwPAYB7YyRUaA3GgbhwCbjm8lMI=;
        b=Z4ldoDD0xQiphVch+SY3kVugMPat2Z/RVe6Etd9lTOkcySlZHlRqNrQsgQz95GxJXF
         Ki6K60n2+qWZ2BB5bW8i/00g8QrLy7o2UkWcV3HH6pNP80kd2U6rmhwkOYLKIE70eWaV
         QzxVG2Sl1jZy4WCuEAhSnmDkNrn6xGD9Gg6HAZ/82QM80zc4wt98gjGxqnuVp8YKr5VN
         iOmiIlq3uR7ATwPfMZicNrjTfR9uyQVbDLCIfOZZKbCHE1CqRbUeTGkA5q1I/GxLk98r
         4m3fczhgKEPOXxPpQfSK4P00GUzFZI/QScA4kyIDSPH0MMAxBu55OgXOPo2xHJwp2K2O
         cK3w==
X-Forwarded-Encrypted: i=1; AKwUvBxzCAEQQLedmj6ab/TvYClcIX6xOuB+6eOyVjkUfD42E1uzgHz0+y1Kv0OmrpgKAqgvdnnmvvh4vFLbjFQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rFqU+kY981pskHTv3jS2+L0n8pjxxoehJmkBjd+QYYpk/Mq+z
	0ta+opIJCpC90CpO3OSGHlEi8pDoozU7aPu/gRfEBNXV+48SQ+YnMe49LG19M03CtjHvByolJmE
	tAQjVWUTUCAfWyKRN9LRUyzjayZUSjTbzbFX7xtwtWNj9v3cJQK4/oLoJnrCk9wEvk7n731FbB9
	IWPWHaFjPSbMP/iDBpXmWkSD+jGpk5ex6A0Fuz7UUH
X-Gm-Gg: AYBFou2GV2hMIz5e7rOytEkZLcXCFCpA33+HZDC3oHM7F9giMczW4CCL/qXw6IJZHRC
	6VWFRr2eEd6YeVi1Xvt2XMXpc5vcbVWld2uIJHwYRVVYCaUmOZSbEyZw4O1b1lSmltvNHv0jK1j
	GYSNdHSDZATvj741eacHX0odT7LwZM/IVggPi1N+QCsSLQP+/JJXna3Qrz
X-Received: by 2002:a2e:97c9:0:b0:3ac:ddd5:55ee with SMTP id 38308e7fff4ca-3acddd55907mr4690851fa.2.1793815026115;
        Wed, 04 Nov 2026 09:57:06 -0800 (PST)
X-Received: by 2002:a2e:97c9:0:b0:3ac:ddd5:55ee with SMTP id
 38308e7fff4ca-3acddd55907mr4690781fa.2.1793815025627; Wed, 04 Nov 2026
 09:57:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-nxp-stm-fixes-v2-0-8ca2706f30ef@redhat.com> <20261103154246.S-8NqN99@linutronix.de>
In-Reply-To: <20261103154246.S-8NqN99@linutronix.de>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Wed, 4 Nov 2026 18:56:53 +0100
X-Gm-Features: AclHuK931Qz4UJ3O8Has-FEwEeK34WYcv8yPrDJgYS60eLd8ID20u55CvxuZARw
Message-ID: <CALE0LRsLS9Hsr_vUZ7k6YA4DJB6Su=E9r-F-btpyOXSvv6cMZA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Fix NXP STM clockevent bugs causing lockups
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, NXP S32 Linux Team <s32@nxp.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

Thank you for the review.

On Tue, Nov 3, 2026 at 4:42=E2=80=AFPM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2026-11-02 22:16:19 [+0100], Enric Balletbo i Serra wrote:
> > This series fixes three bugs in the NXP STM clocksource driver that can
> > cause soft lockups and missed timer events, particularly visible on
> > PREEMPT_RT kernels running on S32G platforms.
> >
> > The NXP STM generates an interrupt only on exact match between the
> > counter and comparator registers. If the counter passes the programmed
> > value, the match is missed and the hardware must count through all 2^32
> > ticks (~32.2s at 133 MHz) before firing, causing soft lockups.
> >
> > Patch 1 fixes max_delta: on 64-bit platforms, ULONG_MAX exceeds the
> > hardware's 32-bit compare register width, making it possible to program
> > an unreachable compare value.
>
> This looks fine
>
> > Patch 2 fixes the overshoot detection in set_next_event: the existing
> > check only detected counter wraps, not the normal case where the counte=
r
> > advances past the programmed value during the read-modify-write window.
> > Replace it with a signed comparison following the pattern used by
> > timer-imx-gpt.
>
> okay=E2=80=A6
>
> > Patch 3 increases min_delta from 2us to 20us: under bus contention on
> > PREEMPT_RT, 2us is not enough margin and the counter frequently
> > overshoots the programmed value, triggering repeated -ETIME retries.
>
> This all sounds like the hpet trouble on x86. I'm not sure what heavy
> busy contention means and why the device is enabled/ disable during
> setting. I would assume that the programmed value hits the HW after the
> wrap so you wait until the counter wraps again for the equal match.
> Worst case would be you read back the expected value but the HW sees it
> later (after the wrap).
> hpet_clkevt_set_next_event() does in principle the same check as you in
> #2 except it compares against the "min" value instead <=3D0.
> Would this make sense?
>

Yes, it does make sense. I will look at the pattern used in hpet and
send a new version.

Thanks,
  Enric

> Sebastian
>

