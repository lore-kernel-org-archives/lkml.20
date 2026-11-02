Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610933;
	b=pQgHHjvMDYXjLbbvgg2UX7GGJLlBxNceizqj/mLEY7I03IbeKNB7A34IIGw6WN8V7ayj
	 NwgKu4WDumKi2bPF5GCJkJHmksNqifke4WIMaPzORuPbEAqtyzFAVv9APaZee6wBIW0lL
	 LAGnDnziUpKJ3FN+nOjQNAqRz25+vhLxQ887/6WPCvgB+NdW8GqXwdaFpKV1kEMD1lRWh
	 wSrZpV2BnX5LkKZRjG58xOwtCVUAQ6ae3Wtg1V+6kKEGEu5QN71rtYdf6UvjyktzsH8B9
	 LG3T3Fg9l3hZII8QTw6G+pO0JTCl0HsYZGqwnWj0qnQbWADibsuufq9yEZLWcaGypbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610933;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=ac+xpJrvd6zfAE97WIurl+pYtHzF00Lzr1WG7VTrgAw=;
	b=AHIORMVg3Um5sGwZMAtrfY4F9K8Zv76ZofAM/wsVg1TFTUdL88xNZ1cHtq5RStfoL9Jo
	 4VbqUTVcywOHYzxnBIl+OCQiHlrDwEg48bap7RDXZLnMPagt/IZ4O2+Riz4cdQDRmHqL4
	 61mO8PlIWFsd3X6WgL8LS+5axZrnG/MiozfnFVPsYn4mxvVNzmzs3ffnl9UF1NSOVf6FF
	 o/FrBxOhcxx23KvCyyOUOqJgpUGiHNU+HxIah8W3+4SLlbJ2flkS9QWA/Ji5WctFVdy4G
	 tNB8OMRyNWmLKG/lPeXV5vAAagHSRpGT2kd+AgnQVoFgC0WYE/IrVLzUL5lgYtzDwYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25D0606A337
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E25D0606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91c79a9a739so45586036d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:15:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610932; x=1794215732;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ac+xpJrvd6zfAE97WIurl+pYtHzF00Lzr1WG7VTrgAw=;
        b=AmkmzURFUqsvblMmhyBQDrrAdTJRASwcddfOG6hUrXW5Qgs/meUuo2QRZiLzsfl7wI
         02mYGJPu/8n0GfvIVskJMNDW452hX24Q7fMrU0bNKbWxNOTHwmt2M3AW43tZon4Tg8CI
         raLTQi6GN70A+ocoRHKQewRADNKseM9LjCc5k4mdt676+x6ZXqZDIgubi6M7bFooOYn5
         wA6pShC6QP5FMZC7r6VTzkdjz4myQ8raUfuJYkp19Z7FQVhNrcVuIdo2AOmV+TTAVPF9
         MKxrqtzPKOUPbaBp17L3HJOORfpZ2uwVoNxCgYv/Qv+RElI5F+wr8vYlNHlnLmVfe8Zy
         IDwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKccUXmZ7w6N47M/rpZ6Bw2BiimruRfcAF7PgmpBBLhNzaUTXle9s0kXqcpeEw6kjmul38zU7Dq3a403w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+30iDOZ3i3pZkvnv5abNfDLJ9GP+SyWrBAoJF0sU5Vg/px6Alt
	SZdOan0e+xT/5wTzSk73DGgnVHRpnLCheZymt2LHskKW9y0FesXN38dp1vCIriVI
X-Gm-Gg: AYBFou0Hys2SXR2pwX6Wbqhb0ImBXHd4LYpczl336J5DMCxsCwp1KhJ7SA5RT9hWgu4
	Ua4DO/ybyPd5q7yjA2MBCaaZlWkJRjsUsGylqdgCjvRjRPFQ3p9gidDwtIdI/yN8fZU433CMWVm
	oj3aKH7SHV0yo4n5DYhyPyzysaq4sNCh9mE5r+Pnrti4cIRmEQRS5/E+pCZrxL3zi6tg68vKYLv
	6FDr8BYnlBe68Ayp9LNwDgAQ3d0KTUMGhZvPX+5R6DU4SQpMt4MiCikiQ9wi8yzTYiouYnhBOa4
	GHfg6OdQT93a9KssJHmJnsunwfFg4mqhY2UnDs9cW1amr27TiroDNV3pynEkwq9lwNjn0iWW9TW
	iwgNUUIiwHT8LD02VFWSvetz/ZXFzSaMwD35sIZIvDOBlLtJtXHKS3q+4Vf73aTcV3XuNUhzk/T
	0pI8xi1Op0owF5nZUKdrthrMmLuafAOcaIBS6KtUcyW0Fiu1X1vVmXSZzy+CL7cJePo9S6gHId1
	UzM2Du7dyLhAAyWTXRq14LuK44H7GjpTIt5AgSYg2a6wvQPQfNkp4BLJCbPuhnvGs4877W2b8Mj
	e1efccCY83+OIINoBF75/JCdLZ9dhDkGJ+T+NGV1xi7QegLSvaVk/UWRcbUVIcR25oppPg==
X-Received: by 2002:a05:6214:4403:b0:91c:8a64:d0ce with SMTP id 6a1803df08f44-91ca4b2f483mr144465126d6.33.1793610931776;
        Mon, 02 Nov 2026 01:15:31 -0800 (PST)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7f47685sm87556356d6.18.2026.11.02.01.15.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:15:31 -0800 (PST)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-533778ab0bdso41476951cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:15:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzO3DDXA+f4ert3lCq1kobOSwrDFKzSsqiEuDfauohjqvimupCNbT/7h9ra2z4B9X7QRpQ06bUsPrIUAYs=@vger.kernel.org
X-Received: by 2002:a67:f403:0:b0:7d0:9587:1b90 with SMTP id
 ada2fe7eead31-7d0958732b2mr1205111137.13.1793610463593; Mon, 02 Nov 2026
 01:07:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-0-e052903a3832@ideasonboard.com>
 <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-3-e052903a3832@ideasonboard.com> <20261030220549.GH3178046@killaraus.ideasonboard.com>
In-Reply-To: <20261030220549.GH3178046@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2026 10:07:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX1czCW_KTW8Z+_jb3egLxqBu7bOUmqyXy3PqYhmUfLNg@mail.gmail.com>
X-Gm-Features: AclHuK-1v1dRSgyK1HeeK29l-3g4aKIGNPop6k2nHA1eLryORdmauRDpRhHjRsM
Message-ID: <CAMuHMdX1czCW_KTW8Z+_jb3egLxqBu7bOUmqyXy3PqYhmUfLNg@mail.gmail.com>
Subject: Re: [PATCH DNI v3 03/15] pmdomain: renesas: r8a78000: Add maps for
 VIO for SCP FW SDKv4.36
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Paul Elder <paul.elder+renesas@ideasonboard.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Oct 2026 at 23:05, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Oct 15, 2026 at 04:51:43PM +0900, Paul Elder wrote:
> > Add maps for VIO for the VSP and FCP power domains and reset domains.
>
> s/reset domains/module control/ as its not just reset (and there's no
> "reset domain") but also module control clock ?

FTR, SCMI calls it "reset domain", but I agree "module controle" fits
better here.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
