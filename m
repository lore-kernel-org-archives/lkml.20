Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C573AA19B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 03:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788491036; cv=pass; b=Qbi55DAPpM6I+dXJCk167XjtsN9IUKTqH002Slx7h+vCkRq8UGgYjdzO6+a8p+/91af6DKQM1x9Um0A8mCNVwbKXfcK/3/DT+Fgmif2Jy5PWIhAOqYwhoo9N1J5jTHif9V2yqfWiE8RSKYGf5AeAgSawWnSFtU+Z9UOoff8tK8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788491036; c=relaxed/simple;
	bh=z2doF7EPWFGqoPz03TF8aMEAMJft9M8wIvsJEX1Rz0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u+s2PH8R9grj7nYZ52ySDD47N9hftPQv6OVsvOdZI05a7fLtQqSux9dyOx7ZLshzOVqQxVrtOLtPR21b6n3tqbudAn3UPLfS3bDyjnV1oAQJeRgXtFh8yfrim1FsQc3fBHvCYX6GEn2+uAXosKgQ2mhpFYf0flNAGnvUzMrqekg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DsPkVhHr; arc=pass smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DsPkVhHr"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84830c774a0so559343b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 20:03:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788491035; cv=none;
        d=google.com; s=arc-20260327;
        b=JOIeM4bx1QEcQ4Pe7wH2lWE02iiMkdAxyGQ66VkgHG/VyGDWCFDihIQpzalhb6rEe6
         bssQfR76LAsr4Vg4B/nq9djqEvSWDNasC3NT/Zjetrd5O/+pnb2+dTUelvmItZkEydiW
         nMG+f2FfTIuugI24TQ4VSYl4cDBBHyLM9ulkka7d2pd8p0PfEKv7XdwF+26/luxdQ7w/
         l5vbRFCmH5yPO0mLquw3xMY+YvlOXyiPY6qLHRVfzR+zFgMJlOmWX7OdeHdnp7XSup84
         pKyIHN8PhgYzWgmUIXHkmKoyue0KCfu7iYb0IMP2S9id98FjUTmrbws7UDwf84L3XQro
         3QnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=z2doF7EPWFGqoPz03TF8aMEAMJft9M8wIvsJEX1Rz0s=;
        fh=nmBecaHUb2ado5EUFjDnqOhy1yJGW8VpqSs9qX6/dhc=;
        b=K2aXy8408JhS9m4qRGZAK1CEelZEnOOWs9VETTpHft6kZDv6O/qkJvi8bOjGrsuGJ1
         3xNmUuBuAwHalJyfdwK8g4kuS/m5zrAIa7aUgQMD+PyQXamRUnm7IUE2zaU64oIqNS3H
         e7oX3+eBPuwgwK/3MqQXBB3Yv448UYqCUx30Q0102HTOJCzLo5HL7ovndr6fR5kpqNfe
         zyhEq0x+tcqZfb+FON92XTU/xX1LybhSFf4FXyKRM0ayoYc6H6nJM0uvTkbY3Kh1QNcQ
         zIxsVUGol3gBFy8qpQTaZUhVEYUsZ6nkeE2xIjpqeS69PowO+eK8TzyoBSD83YpKGGMJ
         9Ahw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788491035; x=1789095835; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z2doF7EPWFGqoPz03TF8aMEAMJft9M8wIvsJEX1Rz0s=;
        b=DsPkVhHrShIvaZ8APLjE0/nXsDKm6u49q/b3QZtHl7rIi2AXruYTXTNT8st7c7tabY
         aizr6Ac+d/4R1ZHe9HgbZWP8ZIXMwmpivW0m8Z8txhurEgEcLM3bizno16whY7GW9kph
         AnIgZzwIF9BnGy3hSxKbxp/qv1Sk1TGfvbqJ/9uyqFxnO2fJSSeYwWni/aanHYpTYTmz
         QL+5LPMowzZvpFjAVOnJ3LC/I6lzj6NBWQNDAV/3tEyK/vj2bRhjbHG3h4OcjWUf2Imx
         ghdvW74ecLcLQiq9yiZ9nT8+crUUuyIjz0kXchIxKNe50DVG39p2Sp8DCneixF3av1qs
         HiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788491035; x=1789095835;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z2doF7EPWFGqoPz03TF8aMEAMJft9M8wIvsJEX1Rz0s=;
        b=fYS8d3oWF3tTYUWs17ullm34XwRuKhD6qM7haTrHzLEw26uXTenQrx7q5i5LtOc/qf
         /a9Ty5CHecl6hyML+St2LQL4xf9yZdUO7yr6zvCWFuCyvbFuOjVIUyVQVzMu6C7g2Rpc
         uunZWbVao9KzEOSHRjuT9pc4YlpTzvB3btcZOvrQulMtgZZkuGoWWvoXf7+EPcalr9Qv
         pnFpe1gWI7CZzPxL4hmSGKBV2925/M5M1tIGlV5AM/B0dnF43fhhWYHbA1cSGVMxO3rM
         ASI99nVlwJJ0ZiAlE2AXGEhhvOfb4cWGu+D/+ybq2+ebXaSc/03bKge+3s+EYosdNvlF
         3eWw==
X-Forwarded-Encrypted: i=1; AKwUvBzFvhG5Kp3MrtO7vL2Jcpd/r18AP8bIqedurTUDf+HmvqdPQqMEMrbSfXeFWVhJ/iJ3wq5bxDMwWpZirPQ=@vger.kernel.org
X-Gm-Message-State: AFuF++korV+/vNqasSYpWwR5AZyNNGEC9v4NYEMFNBqjqvohmC2ghZJ1
	BFyyU2W19wuGeOK6hWQsvtaoM0oHFeEEyYm7mpMjrUc/UMCo4R7LHRZ7EMIrPymIA6yRtt/1bha
	9hF5bGmWYOTiC0a69qDpmCOQixgj7686jYTBi
X-Gm-Gg: AYBFou0Nqy7A/7mur/DKV2qIEpAvUCGAWzLIeZN/QNiXom1nZHjyOGieHkNIXx2d+Ru
	tekNjV7lMajM+6c3oe0SfnAcHc0Mpjdhups5/DZ5HwZDlywsikAMZuuw5TbraaFFs5Rx/hfkqCi
	SQJVKnl0/lD53TnlmF1DGwmfQ/eaFAiVLppU+gasyON22oFSZYuwDWMDZlG+6RQ9NFdolNSCSxB
	xvepS1G0HNK0VBOyWRObuS+j0O1Hn+VW3RPpefEM7WLg6HnfX9kJ8bVVKX9CH8XhsVm3GISjxzw
	/HxZRV0N+Qs24EC+8mHbTCguM3s4pIzDSVpvFwSm8dpIijVUrPSSxMslGm2pX5KIk9HOvRpsbhh
	81YrcyECVF2UThVd8YtiHHSixLtLiuv4qBUW5zz6zTqTKRHDiKiF6X+aD
X-Received: by 2002:a05:6a00:2c94:b0:857:727c:a1f2 with SMTP id
 d2e1a72fcca58-8616907f6e9mr4805768b3a.20.1788491034969; Thu, 03 Sep 2026
 20:03:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903092430.354186-1-phucduc.bui@gmail.com>
 <GV2PR04MB117394049F412AAAC59FE93FE88B62@GV2PR04MB11739.eurprd04.prod.outlook.com>
 <CAABR9nFD1+GJiWdyxiuGVRzKjpCUfu3TQHYOLnOym3hHzOM2tg@mail.gmail.com> <GV2PR04MB1173931CA07AEAB48339FF71588B52@GV2PR04MB11739.eurprd04.prod.outlook.com>
In-Reply-To: <GV2PR04MB1173931CA07AEAB48339FF71588B52@GV2PR04MB11739.eurprd04.prod.outlook.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 4 Sep 2026 10:03:42 +0700
X-Gm-Features: AcwNN1WpmhDLd9SGZogKk2zYLLCenPMMN1VDDLJIPFCLsNZLZHavDM4ZfmsEdqA
Message-ID: <CAABR9nFi06-7=uHmOBFGZv1eUYCskv8WspOdUxbDuQ6vMk68Dg@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: fec: Propagate PTP initialization errors
To: Wei Fang <wei.fang@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, 
	Stephen Boyd <swboyd@chromium.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

>
> Is this a real bug that bothers people? or just an improvement?
> For real bug, I think the patch should target to net tree.
>

I consider this a real bug rather than just an improvement, for two reasons.

First, commit b86bcb299092 was a bug fix and was also backported to stable.
This patch fixes the error handling in that change, which incorrectly
treats errors
other than -ENXIO as an absent optional IRQ. Therefore, I believe this
fix is also
relevant to stable kernels.

Second, the current implementation can silently ignore -EPROBE_DEFER and
continue probing instead of deferring. On an affected platform, this
can result in
the PPS IRQ not being set up, causing the corresponding PPS functionality to be
unavailable to the user.

I don't have hardware to reproduce this specific case, so the issue
was found by
code inspection rather than a user report.
If you think this fix is appropriate for the net tree, I'm happy to
retarget and resend it there.

Best regards,
Phuc
