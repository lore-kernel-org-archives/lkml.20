Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794614267;
	b=xJlCsNyAZUgWNBFLNQuRmj7kdYIMU9BaQfTnJMozD61aiVELsMJ28aoPZBI92+KE9zry
	 UUvXIP6juw33u8Mr7P2RH6SGup44UPN9+eKIKUGTUtvqwm5iaBetTzXtyyU3gYR0U5kAS
	 nSnVTwvvYtmWeK86F7hM5+vDIK0mF+n95EsgW2aZhv97UcRvAzmruAwDmnqf5Kmrg+4t2
	 DzjQ/UIvehd/Acf3d9De8xLCir9eyAAnso5L7084GFqln5E7iyiE/iqrRXDD+FA+0AloJ
	 nG2RSe/HUbgi36Qvn1cExPW/1v0mvSay3mLhhvd+vJhpgBi/PTLdWHgNvzzKA4vUnTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794614267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bh2UNPvOiO8aUnufjFtSOv41iN7jBr7C/TgT2GV+uOM=;
	b=mrPfrvuabIhGcZDw7yNYUOO70R39X7bdZymMGeCrUUHhQ7Tbmm5eN5ZLDwDrYympBVPF
	 kpZIEDz/hToj4Wr8FDw64tLh+/yUFdvYzz8D0q+1zVEDmzOMsNluKXQJf/lkFXx3QWupv
	 5so8iLlYiiHuVWP7CBj/kMRy0mQbnl/foburoUtp56VxDdWSG6PanlTY1TCEfKunINU4R
	 Qu7YgUxxOBHsmCetTX3Pd4qK2EXHX0OFh+nEF3h5GJH/k4KS7OaWItCDE+5mAiP/kNK+U
	 ZKDDgWpiP6fsjVzKTBbGicyu/ssSgD0vFfaL2d/aDdEDorYaVyOLTb1vIcFZb0FvTCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AoApEqsl;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D7F606A33E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:57:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46D7F606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AoApEqsl
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b633ddfad6so2828724a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794614265; x=1795219065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bh2UNPvOiO8aUnufjFtSOv41iN7jBr7C/TgT2GV+uOM=;
        b=AoApEqsldD33Mzw8Q0Y5Ubdt7meVfWlqgKmEgwh+yPmD0dZrNuAZJeuYvU/ApgoJWP
         mx/WvYqzY9U8Cz9kdiRFhaPSvuAH6lJz1dfduQmEedaSDYFTzhHLUToKDt/4YE8gA4ak
         5UB0ktmFKc7X2WnNQe1vcyZGBGetpaZYXqYaqCWabrhMZ0qHkTBBVRvVo/rUKLUJHj/u
         TC6zNVjANSvjxrHJ5+vbGvQx8ZfkRpXGjQ/zJHA+3eOnmK4mBfWhwAibenzsq2v7CmgZ
         9Pvlgy1LyM9R/Ne9/tqXLZWtSYEFrlMQ2Q66Nz2kg2pZkbXOH611GKGjmh7vCCCJ1k/S
         RWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794614265; x=1795219065;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bh2UNPvOiO8aUnufjFtSOv41iN7jBr7C/TgT2GV+uOM=;
        b=lQhndoT7GbYlkh2FKbF1Ec5WI6SYZhPDZjs6HQ2GHoV9Aq5CJyzT29V0WHnlpnfaiD
         s4a4nFeRSnb2tQYAH5ae3/rFFkwmTf+F9vLNIbiPfRAqMYZez1KD7zV50a6jiALiZmgI
         AAVuBvCseyKcELo/8dXGzXfuLIjMBCpB2JvIHITHmQw1dktgmB6W3pMCFIihMcaZiOmd
         Acgk5oFYzftTlLlMOceJrKblLZ+V91lAmds1Deu4HZDpLQgSEVwf/agqi86UcMDMkeBJ
         Kb+1vzIA+VvuKRoRgKbFvcqUi68wFm/ml4Lqh3Ote+XRcj41Zrl9jlRzpbSVn8dx18VK
         s5JQ==
X-Forwarded-Encrypted: i=1; AL+hErE4gjKVmROiegcTqowzdWESDUYC1+SHPtuBge/6LvtPVs6B5tBK6jqwgE9g0GwqQFPKSiK3zC1MP9D4GD4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BvVkVwcunQG5rk8nPhB9jPOpn5bSVxkmSMSgS+vhaRzVLVMrz
	OF7PoZ/DoAeVu/C/mbaNOvgMXcHltzIaXuQx4g3k5l8zs5giPgQr5ESz
X-Gm-Gg: AYBFou3YU6wNZCS/BvW38gzaPCXdZIvqGi32Cd3KOuB01/8S0bnVFDWzB+NSiHCrMfR
	fzJp+nsYINH/6kao4kPzNuO6D8Xi1ozEM7JEFeXYSv/8aQiSvDPeUd45KTedXLfG8IXrao/w1R8
	6oslFlbAVL7Q0l/yvCFQx6iqSCuOQkMvIG6TCTB2YwzPGBPW42R7SYy5kvQEMz/EX3PRWZfBzxi
	L1EZY99u1y8OgN1T93AjQ4Iu75hjVLToScUdd4cWh97w5eATKQmV0miAkOQzL9av3TE+CHNlSV5
	09MzZ4yHcEbjEOaDLf/ywhW13PeZbOLJfTnCb6gFv268pF24IMtIiu58RKt+XQcqTGIowSvYVP/
	RoRPzlFCsuUWd4CPwegZlXiGQgxzsCKkz2D/55MIrkKR8l9/If31TdMiFHMTMPTPprBZsEXLFFi
	wz3oQTsnHClV7X3vM1BTSYOBpv1eiiqJZmEqxiT6Z8sua94501KmUkDZMII1Jf39fQMbMgVgn9j
	MTswsXquocoobJHuHfda4CtG6ay0obVE5pUgBmIMPhJ6P1XKOyI2uZLw9ATzPK6FsTi5yUJDmha
	W72bhXi7WuDSUc7mVg5Tnpsq6vRyVUBi6LfAua2O
X-Received: by 2002:a05:6402:565a:b0:6b7:8ace:4bea with SMTP id 4fb4d7f45d1cf-6b7c0bc4f57mr2643744a12.13.1794614265353;
        Fri, 13 Nov 2026 15:57:45 -0800 (PST)
Received: from kordpc.lan ([2a13:e746:396c:c600::8f9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c21b1a08sm1577698a12.5.2026.11.13.15.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 15:57:44 -0800 (PST)
From: Kordian Chmielewski <kudzo51@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	bcm-kernel-feedback-list@broadcom.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 1/6] net: bcm4908_enet: fix the TX ring wrap
Date: Sat, 14 Nov 2026 00:57:42 +0100
Message-ID: <20261113235742.516908-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179460252768.2199510.4667025168810979943@kernel.org>
References: <179460252768.2199510.4667025168810979943@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 13 Nov 2026 20:42:07 +0000, netdev-bot+sashiko@kernel.org wrote:
> - [Medium] net: bcm4908_enet: missing barriers and late write_idx update
>   on TX ring

Both parts are older than this series, and this patch doesn't change
them.

For the barriers, v3 adds a patch in which each side publishes its
index with smp_store_release() and reads the other side's index with
smp_load_acquire() before it touches the slots. It also covers the
bcm4908_enet_poll_tx() issue below.

As for the late write_idx update, start_xmit() has updated write_idx
after kicking the DMA since the driver was added, but that only became
a race when the TX interrupt support moved the TX cleanup out of
start_xmit(). In v3, start_xmit() publishes write_idx right after the
descriptor, before the MMIO write that kicks the DMA, so the window no
longer spans that write. As the review says, though, it can still be
there if the channel is busy with earlier frames and picks up the
descriptor as soon as it sees OWN. I'll look at it separately.

> Pre-existing issues:
> - [High] When the device tree has no "tx" interrupt, TX completions never
>   run, so the queue stop/wake design this patch adds cannot work.

The v1 review found this too. Without the TX interrupt, open() never
enables the TX NAPI, so nothing frees the sent frames and TX stops for
good once the queue is stopped, and stop() hangs in napi_disable().
Every in-tree device tree that uses this driver has the TX interrupt.
Florian, Rafał, would you rather have the driver require it (and the
binding say so), or poll the ring on a timer when it is missing? I'd
send that after this series.

> - [High] bcm4908_enet_poll_tx() reads the producer index without a lock
>   or ordering, then reads descriptor and slot contents with no read…

Covered by the new patch in v3, as above.
