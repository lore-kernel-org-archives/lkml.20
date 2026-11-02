Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649311;
	b=hpQmIx7lulGRQICiHhm20Q/KbQ7F6D7fJAzqK6DfpuXUaoUwM9HhRYmdkWUFrOX7CtxL
	 Q81TKi4GmwyguPCkP/dyn9bI04RJ4Q/lPvLx9nNfNu8FlPSWJ4V35v13tCDBlsvfBI1dE
	 iTjvpInr7GiXLyQRVBUMm3RX11EMVANYnZBGZF7etUF0zaROteucE0klwJbKnw6MUPKSr
	 IJd1hmduZXCsxG/tZHekj9tuJiPCjif7qDC/6jSN2pAInaLVy3GQXLMlfEI5FZWjDAix5
	 Z9OC6hLdXqSgvQeIiOu2YqLYI4yLe887tMyw6aZaCz2+lw6qlcBr662L0JZHyQ/OIhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8S1OPXeizVR6aCx7kfE6r3MpJonS/IfzX68XfZXD+y0=;
	b=4J31zMpWRcaebtxkJpOq8U7C7hhqhX2zLs133RrVIARIdRw8tqgpYmzJUKW2V9tA2gBK
	 EroMstZgpEEHiiBvdhNOdZD920xwUXLsnnZDqxB0swjQY0Fz5piBWcosMGHPpHRZ2wD5t
	 /gGlH2hOzBcDdeZ1toI6s7nUwLniiegAXpWAOFMBU5PtWLgeaxWg830yMVyDi/A94BE0L
	 J/SCFqqbspPgPQxwO4KtlRADqwh8SjkvEvOpHUyZABzL4jRCWJvinWqhD962m8fXrFl/7
	 CnMWkMjHgZk3f2/gkplxOGuDWF5p8xyIUce9TzF7q+HNoRT4Jw0jXwNRVmkoLALtUsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IzzOOCdE;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E429606D82D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E429606D82D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IzzOOCdE
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso14253565e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649310; x=1794254110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8S1OPXeizVR6aCx7kfE6r3MpJonS/IfzX68XfZXD+y0=;
        b=IzzOOCdEHsLpF86IkNs9HxVKY9A0so5vOySkAg+Dx6bqY4n2pzS1LE9liuU5FRfITa
         DupkIzl0EBcKuIgKdo5R2mzKeRkf54EyTrxwufdP2Gt6sETEQ9bPiCmA5Hv4x/OWT1Og
         f1NtU4DtSxfuK8veHGKhni4hkQtDKYkrSCjQVNLAdY2HmfJqNbfpLk6fQmeDyu8MW8WS
         tMNKKyipG18Hn/NXEQ3bGP8zhcmK6PV7trYmFTvmjnGe17FRTslE3cuqu3/SPlUVgOlQ
         Ay9/uAXjiYXyOpRZiIaapbayx+X/x9f41iZRji61aRqQyPh7wnJ0aaxevVdpAvOsPQvL
         EJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649310; x=1794254110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8S1OPXeizVR6aCx7kfE6r3MpJonS/IfzX68XfZXD+y0=;
        b=gaCAZ6aBzlgOjhIpugHLrLLe8eYNud0wsKXb8/mjefFj0FIuwo2RnwkhTHCtdKrUJs
         bZinaQJbeOwUerBeEuTQfI2cFhwNOqfc7Lrw+XPu5vvVD16sfcsh8grAbxgA0y/Ykr/4
         mO/uYOGl0dkvn6eGHIVdslaAlv2vQwmpWYHgkx70LBDl18YAU8/o6LntRhmjJ36LiPck
         TAWy9LBFOPhiYacze2xK/VDdCpkeASwjBKucY8OaStj7wLOeLgzuyXuiF4nfajOIeaxB
         qPOACnobn/FLXRTu99rcwXjXLPMV6dgFV3+ZkY1FtGnwDdkC8xwn0XJT9XlKdGnumKN1
         bqbA==
X-Forwarded-Encrypted: i=1; AKwUvBxgFCzik8e1dWM+NlxpMgP2SlEpGSYD0gcxbOkLA8SBGh/YuLgtVJjjfYSv7ehKBAHEOQ1lEJkJpsBG+84=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEiI0AH3w+s0H/z1pdOTUJH2/rN/7b0x+Dr6TZEfSYAMBsyuRk
	m4IrRzY5Ti99iuTTnMWb3vZLZ+ROp6wTj20EO1bu3mjlwLPR4fY0/uey
X-Gm-Gg: AYBFou3aLHSefLH2512FXHHQRhdok9uzTMOuW4pxtf9cvnW6RabledFaZKo9gAR8nzd
	+iMg0ML2sYZMry15u6JsCR6Tmo5aB1wU/2DLQ7bt8g/VQtCxbFQNuUe7iVhvj34ZcXLA1OGlVZY
	YIvPJP8pZc+d96477EIyrH+Sins+ZCBP/GvdXQEkf/zb/KdoZEshZ/8n4yMM++vBijPfyMj5fVW
	u6MH6W1YYuBYbr2BUyp5x/r+6PhrHVYdzN7WQPpiyMM9MhPGKy9fPD2EVb9lSbkBigdtXGm9j2Y
	DFux6dcaz5KCwQz6iCRD5SjRc0ag+sp09mI3wnNOcwiTeE+k+BGwyVx/gYBI3ppFLIevLa73TNt
	b59WzLXO9Nsp2jXZuOw3fh2d5wqEI8mC419YXos872WLjjM388kWJvcT0P8dDfA88v1gIyCQom0
	k98SJ8ZHSq3Ez54rIkbkiMfqF+OJc3W6BxaJm1wLc06ioHz8NNAlq079sACN4OcGV9PCcaPfOZJ
	X491F6RbhadDAjn8TKw7TDfx0hshfQv7HJCAVKafQqEDENO6X1tPTN3sEhsNAFpTGREtqqpOmrb
	o/4ZIb9VvRk=
X-Received: by 2002:a7b:ce0d:0:b0:4a1:715d:1913 with SMTP id 5b1f17b1804b1-4ac177538c5mr196973475e9.1.1793649309659;
        Mon, 02 Nov 2026 11:55:09 -0800 (PST)
Received: from localhost ([2620:10d:c092:500::7:f93e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a922c298sm7233965e9.9.2026.11.02.11.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:09 -0800 (PST)
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Mon, 02 Nov 2026 19:54:52 +0000
Subject: [PATCH net v5 4/4] netconsole: stop waiting for carrier once the
 device is unregistered
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-netcons-fixes-v5-4-bdada2f03563@gmail.com>
References: <20261102-netcons-fixes-v5-0-bdada2f03563@gmail.com>
In-Reply-To: <20261102-netcons-fixes-v5-0-bdada2f03563@gmail.com>
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Stephen Hemminger <stephen@networkplumber.org>
Cc: Gustavo Luiz Duarte <gustavold@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

netcons_netpoll_setup() releases RTNL and waits in netcons_wait_carrier()
for up to carrier_timeout seconds for the device to report carrier. If
the device is unregistered in the meantime, the loop keeps polling until
the timeout expires.

Stop waiting as soon as the device is no longer NETREG_REGISTERED.

Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261021-netcons-fixes-v4-0-3857120c6340@gmail.com
Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
---
 drivers/net/netconsole.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 238acf300d23..895d33b179e7 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -383,6 +383,8 @@ static void netcons_wait_carrier(struct netpoll *np, struct net_device *ndev)
 
 	atmost = jiffies + netpoll_get_carrier_timeout() * HZ;
 	while (!netif_carrier_ok(ndev)) {
+		if (READ_ONCE(ndev->reg_state) != NETREG_REGISTERED)
+			break;
 		if (time_after(jiffies, atmost)) {
 			np_notice(np, "timeout waiting for carrier\n");
 			break;

-- 
2.56.0

