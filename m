Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523B24E4C41
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790615914; cv=none; b=MUH8xoKshZ9/uvXnj1IiBW7BR94/+1NMH12a6sGy8RBYs368rxiZj4yL8eDvS/xBqmG1tvlI6HnU2ZmMWyL4a02uJGw32DCT4yesgkWMiMstv94pfGxxrXhUdvYXvevnbyuiubyYr3NfVI7m0Xpl/pZ+YWqzBv6zmkiw4KLrHFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790615914; c=relaxed/simple;
	bh=Qk5juJXyHQAA0FzltH0EG8o2EdUhAIQpUus6d2gQKFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QcUEVTdByo6PAde4cSCjFBmPXmGYxdfIAyUAKtniYpWniDM4Yy+QtkoTmfLBNKaBW3PT0W4/X2GE+bFP6IUYlh7wHgP3OZWTX6vZUb4Y2nVdD6FSbWcKdGQG2UnPF6Dah0+vRHLVl3vyrTyjvjW99tKQk8O/Rg9KV/eLq4fy7XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=zB52uXrm; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="zB52uXrm"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485ac898fa4so2749109f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790615910; x=1791220710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lAKGigWSN+rmthZd67UvTxza7+7ujThB0c4R/68QCpQ=;
        b=zB52uXrmMGo9UexeNQjLWUDlTG1ni7RdR7mMwXf37tFqrXuARw6tWiCM61TyboAUm0
         CY4e3htScKwQ46JsAB+UNMj72En6A6xvJgYi6Jiub5fAtvjlRdirW0E5EQOC+ZZINCeZ
         PpCr+2u+MjqfMVAQyetfVlPsdrR9T1l61hCQjArNUTWRb2ofVW/crPSSGRYCDyvfCOzd
         utH0nHCxgLB+U70TsfpPMHFYU0OHFbGVa1lGIS+iG2FBHOkDM7Li+Cdw+mc0fPVY+2VW
         H3otPlgqCtLvm/M4rlawJI8WA3KFMD6L6dnqi1chn7BKy+yR055pl5864kOtFCt0KBoh
         Bw2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790615910; x=1791220710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lAKGigWSN+rmthZd67UvTxza7+7ujThB0c4R/68QCpQ=;
        b=qiOIZQQmAkCuKjS1igrNsAwCFkJe3hDVmMtPwez4Ks93M3RNdCizxHZKQrvFD2s7ck
         hKrc3fQ4Ut++Z8SkkmtNo5yn6/EeyKbWMe1QyRCmQHVTGQ5/0KFQVV0spEJZx6W/4IGY
         vAbUOjemCIdkCLbaWAESSf8IwO5RXmk3C1tSVyBbeBtzNE3efc44j206KDuYJqFlb1TX
         ZX+Br/L0vNbMw7nE4LZJ7y5hWITapoTudt6UitwmrmohLF+zTqfa+zuXQsY/S1HY798g
         8mcIyq/CIiiKgQ81UZkwTr7jKJziQSUZnJz6WME3I6ltnQjiZTVVUzjuazAmHrCCjVVB
         Ac3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxH1Dwrnt2HcnBq+PolBlfUFzWl6AtmWBR9XeXZPo64KbE3Xzvs7ccU47m94Hvpz1WHWvjHZM6GGWSNvoQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZw6HNICrPqX8/tTeQTBp1rvPv4BhqEUdag38K1Gb9v8HtG01R
	RuuChcfI2X4SA29x8XwmxDU7w1PV7//1/QoNMpsb14M2+B/u8E8uOzTQj0MtlvVlRI7I+lxVq/E
	TxGzo
X-Gm-Gg: AYBFou0dlp1qljw8i7TLpo04vApMYSNtw7Zz+zt6uxLYavllJavZpp5rBzxstfA4UGr
	ddSXgrBU/ITqVRI1Gc2uz9LC2r1Sd6lXBbn8GEOa81/+MNLB/Fo9M6oTTA72Bm/dLQVzlN0jDbc
	QUedzQ1M7bh6DEaSlaRqmgUPNjvRmytZBSs8Ahft1du7jglkj0r2p/WK3RhupmSpIPkZ2Ubk5mY
	kqooZA+5UYslznHaeYw3qXC4wD1PT7VXYGQxiBk+h6yCSewS1Zb9IUv4D182c9gXa4VKROFTV40
	5ZFKLZEyoCgI3w5GzPz0FpNO05C1ayOqB3mb5X2f9HNFhnN/FDId5o7+sym47pWdPryp3E7FSkT
	kqtWxu4Jlh8tvvP2HparaFIzKMoWwdns8AZNykzSY2kynYcjmTuYsmEum3GjL/duaO+St/cpnEV
	u4nnOSUXI2ZkmUPkBwvqlVudjkPD7g24G7H+Y/RFs5RHYOf/MXBhq0mw2hhYpBEo4eOkolWiAQ3
	c5q3aow6L8uDXjZjfKZWUuKPXs=
X-Received: by 2002:a5d:5e83:0:b0:488:84bf:eedf with SMTP id ffacd0b85a97d-48884bff147mr13188564f8f.48.1790615910338;
        Mon, 28 Sep 2026 10:18:30 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a84221bsm29224973f8f.36.2026.09.28.10.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:18:30 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 28 Sep 2026 21:18:17 +0400
Subject: [PATCH 2/5] dt-bindings: power: reset: syscon-reboot-mode: allow
 supplies
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-b4-rk3576-reboot-mode-v1-2-65486b03bd41@flipper.net>
References: <20260928-b4-rk3576-reboot-mode-v1-0-65486b03bd41@flipper.net>
In-Reply-To: <20260928-b4-rk3576-reboot-mode-v1-0-65486b03bd41@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1488; i=alchark@flipper.net;
 h=from:subject:message-id; bh=Qk5juJXyHQAA0FzltH0EG8o2EdUhAIQpUus6d2gQKFo=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtWhjXfaohRDvZ2oGd+Uf+xu0+NgEVbXrP2LMEDyzYf
 lr1rO2njoksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKa6nZPhn7Ve/ve00199+Wc0bUvTCPwY+1/4mM2mrXznHkRFzJBZ/I6RYbvqtra
 ZZ5mnWmQxbU9nqIhql5C2M3tQtGISw1Peo/8EuAA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Whatever program that acts on a reboot mode runs before a full OS, so it
may lack the capability to enable the regulators it depends on, and a
reset that preserves the mode register generally leaves the regulators as
the previously running system left them.

Allow a reboot mode node to name such supplies, so that they can be
turned on while the mode is being requested.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 .../devicetree/bindings/power/reset/syscon-reboot-mode.yaml       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml b/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml
index 79ffc78b23ea..5ed70c87269e 100644
--- a/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml
+++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml
@@ -36,6 +36,14 @@ patternProperties:
   "^mode-.*$":
     maxItems: 1
 
+  "^[a-z0-9]+(-[a-z0-9]+)*-supply$":
+    description:
+      Supply that has to be powered for whatever program acts on the mode.
+      That could be a boot ROM with no access to regulators, and a warm reset
+      leaves them as the previously running system left them and not necessarily
+      what their expected out-of-reboot state is. Any supply described here is
+      enabled when a mode is requested, and stays enabled.
+
 unevaluatedProperties: false
 
 required:

-- 
2.55.0

