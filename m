Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401515304BC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066665; cv=pass; b=D1x6h8SBQ6la+pr8Ao8Sa/be6crhXzLcclapWFBZbGn20LyWvtd54uA4Asv++t6AKKTybDm3wzkund19EyCw32f7+O4ZAtb0AQeG/RHWfvCWsZ1rg+ph9Zg8su0/8xYF58rsETn+0Kg1GRYpnnzw2Nuqw35ocEH6Kwo9nXYQF8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066665; c=relaxed/simple;
	bh=u5qQmLy+pyZNGMwYq8Tx+105RlM9v+qgj/NhiJHu++8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BV8ckgnmTVaXsbOi49eWBAxz/ful4jtZxALZgCdhi2n7o4y5Cw85LCsdP/5y03Uo6phdIT39L/oqknJ/euVaxUHQhnHRyDHywmDtuD0et7IKEUTPePRLV5Ofb5ZUmc25ftKjCaKPSyyK4c4XEtqezQpjkGYOjGNAeJJKLD3glrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVpOLVjS; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVpOLVjS"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1651cso3461669e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:44:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790066661; cv=none;
        d=google.com; s=arc-20260327;
        b=I7PVZoojQPlca8VjhBPx/MG3529nYhG3+Hc/op70IdF/P0XnxsMviWTR8fUvohcGOz
         8zvWIHDZMJzPKP7ExuIoy9r5Wk7n3mkpykyrgeZlTuf7hQAX1yPN2GpXviMs6j9O3bb5
         0+u5yKIPN+UTHlv6ysHUj2b+LCTEGa5jZIiC/naj0eAUYrnJ5+1OYpikP1Y8FdsQ5Fnx
         vHu7KtdCoOx+9Ur39nwCZTqBjml3vnMfSEftiE93TSKrW3r7PKhHNPBeJE96QccsCynd
         xwCRYsHTqOSdpcaHwFab7deJDlB0DtcmxJX4Z797E0qLICv9jANxO+zvgWjZsouM19jH
         C/JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WsVALZGvNuNx3Pr3M5+XTqulMSxCzM1LXdhBKksMaY0=;
        fh=1O0JPRoqErxjcOcbqZeJRmIhqR2Jg1nOgCCpgWjXabE=;
        b=Mmi5UyRYpuBQbQK1znEV/hH0wXFnvKKBODTHYSRx4x3fPXQ0eYYmKjNCRb2AN/M2g0
         FPBqHOBC3ReNhAse+0MWOkyeLp/Llpocl4uqWGvWeJ6ZLKXuCRnyiv1vKiR/6spq0PKR
         gS32P+vCL7IOwtY2oiVnbLT9ZclDV7drXnFaOQ6Svt1B58S18n9IebnIxMhP7E7eSYaD
         aY55/YZrkzgXIk/GOd4zaDManlkRevYfsyZ56611skbVpERHhlYXT76JHgrCqgCAJHN9
         jAvlRKdFlc1xcBiLKVG/FHNWfaHvuO0VZN3/K+dY+JpeZVSuFDUIh/R8HNLI87cSDB6o
         Dxlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066661; x=1790671461; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WsVALZGvNuNx3Pr3M5+XTqulMSxCzM1LXdhBKksMaY0=;
        b=SVpOLVjSOXBsn3X5rkexY2ODuRiSuigeaafcuqg9cc0HEEB33C0aiJW+lazBFfuT4V
         CeT8vlWAhfevQG58IHZboFwmSizGlWIEpEbReSlUBkmLNC8PFqUP9gQ432RIvRPmKE/k
         ag0YN4WR88xDkzaMXHvCGCAjhrVP+DWfFz0F4PirVfThOy7ytCxggEjmnq5S9swoS3uY
         R++kyil7ZJUDyhyPsfDri1h42SlnYsN67fbdtXMkiCTZDzuQli5g3xkFijAQ+vMzJM1e
         nmPh9zpyKo7rUwH0AhPkrlA+qMRhKZVF14kWqH+OzH6UR2t2eO019tWDrAnMdZ5IGdS4
         f3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066661; x=1790671461;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WsVALZGvNuNx3Pr3M5+XTqulMSxCzM1LXdhBKksMaY0=;
        b=NSVSkRtR1t2ydbaFvH5ayDBgXH/9niGUE22Uz3SgWG9auU9SBRb2g65G4hGBbjq5da
         UxyVEmt0NWa00RlYHZ/n15r4RGP89ol5JblJNOrfaay5LsehWijpZljBLxmccO8f5RSs
         jW5YJ24eLAeF//b/P7HzMTE38QZV7swUe7vCxycO1cg/6DiYnMzozz+j+/uPTkf5fuKn
         vqeol54b3mBNtYiF4DRZr/orpEJ1kZT8hlSy9dsEMCYfYMKnziV/t7laExcaQf1lvM2p
         Uyfz4ie6JsGudPkral8V5g4sYSYmkByEisPeBRxOjM6zUIdIk3/3sef14OnPkeITlqjp
         E61Q==
X-Forwarded-Encrypted: i=1; AKwUvByh1AFZzKyCsA2yKPpLl/iOKQUpo6aosS/YWrmRSYOZl3tM2YDHIvusWCuc89ZsCA96oE3/tgfO2zrjTWU=@vger.kernel.org
X-Gm-Message-State: AFuF++n5m3EIU+U5jbLl/hMfFyhI7/9jGzPMtloDZHCdA6IJC2qZU+iE
	FtlwaQbycLF4PsvK1cjbptv8WihDLAaFWg3IzJE3LuyzAfESgDqvJUzmy/X1ojb5Cv8cdUaOKTt
	a2BXGgJiAm6DBmuq+alxQklb2xQDel5s=
X-Gm-Gg: AYBFou2MJJAMDsVPYgOGSa69taPnemKO8Mheo3cZW/ItntidOoYR20IDI26R4iQeSdi
	oqIaJrYjzvKa3d5C/crHMPFgT1xwFGvlu7wz4VLBklYWxjSKWnrUxLuX/Iua9i48AUo0M/tNolx
	KCS1CyF45sHLj9+vW+36S09UxoB/TfP3WKXGzYssc+b2UPtZ85bU5fhhB1E9bphXiuocAp4fUS8
	zgLxjf9gWytRfFj/SqtCUikx+vZkwJTUh2cYPCdHB9AT3Z6CyP4mgW5v9KlxsnRVDpF1hm6oEi+
	Efmso7MNf9Xm/NOxVHqT0HhCVrRlIEtPVN0C0WiCslUiriujc/C6DWJXJqlDdcF5YhMDBXwlWLR
	T+0v+5RfY9J/tqcMmmDBwGSSg3IQ/T9YkbhZIFsbUnWZn
X-Received: by 2002:a05:6512:b9e:b0:5b6:1870:2689 with SMTP id
 2adb3069b0e04-5b8c1955f0emr3870626e87.58.1790066660778; Tue, 22 Sep 2026
 01:44:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921235951.3214-1-sigefriedhyy@gmail.com> <20260921235951.3214-3-sigefriedhyy@gmail.com>
 <adc2bc61-d832-4e9d-818b-e5d03fed0fca@6wind.com>
In-Reply-To: <adc2bc61-d832-4e9d-818b-e5d03fed0fca@6wind.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Tue, 22 Sep 2026 17:44:07 +0900
X-Gm-Features: AcwNN1VJxh1M-j0f2S_sS1Tn5lZAUShRZrC3tTvY2gbK724PVnkPgKNJHtZU710
Message-ID: <CA+7S2v+CCVeVVCeF8_hxL=mya2pjrT9By6ey+kAkjRWG8xQ1hw@mail.gmail.com>
Subject: Re: [PATCH net-next v6 2/4] net: add AF_PACKET multicast dumps
To: nicolas.dichtel@6wind.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Ido Schimmel <idosch@nvidia.com>, 
	Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Nikolaos Gkarlis <nickgarlis@gmail.com>, 
	Paolo Abeni <pabeni@redhat.com>, Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 4:20=E2=80=AFPM Nicolas Dichtel
<nicolas.dichtel@6wind.com> wrote:
> dev_base_seq only indicates whether the netdevice list has changed, not w=
hether
> the addr list has changed. It's only a partial consistency check.
> See inet_base_seq()/inet6_base_seq().
>
> I don't see an equivalent of dev_addr_genid for the L2 mcaddr list; it sh=
ould
> probably be added.

Thanks for the suggestion, I will fix this issue in v7: I think I need
to  add a per netns counter bumped on dev->mc changes and combine it
with dev_base_seq like inet_base_seq() does.

Thanks,

Yuyang
