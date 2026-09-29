Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DA050EC04
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677734; cv=none; b=Jb8FyJGp0/cgiDYXHe+Zf1vo46/0m4vJDa8DixalLXxnUHO62J1Xv0tMIlM5qupY09+q6GNwDLw+AvTPg2SWKBk5nnihsbatRybDxlIWb8Bck8SPjkxcauk3HeykOQueqjhY3kZ70Durv/9jc4Uo/DA9MKEMeG4upkQPC97T7rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677734; c=relaxed/simple;
	bh=QQGLNQvdHfru03RYinWVR9vfNnySQYKGE1jNzOfXc3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GWAfDcE4ekA+jXrHwIxvlSX+i0zA+dIhRmqrvX5jmSHjBtLKXccFIalpDxxFHV1+u63aCuGRwuyPNiAgj+v0WTIejkEObDZujtoI1ogNrQkVoIuGlYPdLk3w/qgcHHOBx3sZrJP7Nj6A6bhBBLyCH79nBqHy1GIb1wpq81Gkicw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=va54BRMl; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="va54BRMl"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a00d8bec5aso4461755e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790677719; x=1791282519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QZTRsHj0KfhwDqKEq7QsxYeKNtzFQI0k4FjiWBg73As=;
        b=va54BRMlUmstMfPhvAkc3qh7l4QbuX9cKewh7ip8Rgy95qOTBtz0mcZmHRfZlBvNLe
         hUd08XSXNhrZGYV1yHUHCeUKS6qO7wWKkmox6xi0bgXBSZtHCydwBxd8sAvX0P97Bg/P
         slwnNB/JiF9aWW1JH6WzrEQsjBHKJ64/ElsM7b8ZA+bTcS4j4H0HEcpm/oPZ+e758Em9
         FZYgN1dssqDeYwgGY83Z46L2e3BSoqiMh9ZqeAn+LlpS78PCQ0K3JuOt+l+M9yyHMUXX
         Q0oUjA+OS8BIHh1J3eydIK1g1viOZNWc2kOXqSzf/iz87WavPxQHW2kvE23bkgZecWzX
         FsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677719; x=1791282519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QZTRsHj0KfhwDqKEq7QsxYeKNtzFQI0k4FjiWBg73As=;
        b=dXQyurD2d3Uzt+4Nm+2gNhVfdHiNxKN8YGWf+5cebhtcPy9NHCJna62ok46F9SCRi8
         2xNHMzcwsiioB8FA1Xt+kAbOxnQC4P2uouulFn1vZNLytkmLg3xwmhHQIS907E1CImNe
         djkEGbozA8hX9mfgRNz6pViJfFLPbajvkvupjXQ2qZ6l2t6vqrB/2uMQjDWO1ADhquAb
         cdoaAJtbCgGniLem9GDCS9aXzEcyZuxBxSsafRm72y42baVfM2Ec9is6Y7kcxDAnmtg3
         iekIKOZgICjaXfqfkqPHMUNftO6YsWn5gHIA1gOJ+0YSjcVPomo3IKiiDmTUOVLEnQyW
         vaHg==
X-Forwarded-Encrypted: i=1; AKwUvByZ9/Kalj9AGakOVzKKEXa8Td9EPY9S26yhxupG4TtFtpLvkz3O96G/FrIqZUy7wnk/8P239BTBYi233eY=@vger.kernel.org
X-Gm-Message-State: AFuF++mvDdyj0QYXQyMhJflg4ic9ixqCfHuVjqHGXyXlGXQTPo0bOHAv
	ASSy/XPn0G8wVqrx4OLoAyui6wD2bY5rASl8OI7JRlN/9i6SZjEvkKvls8ahpcrer3o=
X-Gm-Gg: AYBFou3/8MXWyG25MSLqJhZ+DJ0BBzBoQ76C8XiRoUyhwxLTVVwWkFThDTuQLV69KMw
	qUtbsbiW3akW7y70HQx6EuVuvnrnX79GIsTyQ62S8qhAaRkHUxvRZ1TevdysESU3/6fctCp5HLR
	Waq2UwMK2DBw/aMAgfI9HKYjaxPH3lbm4szG2oUAmqZ/6HqLdUpMQgIibgyPwxWwVuEHPZC+c8/
	suGxYuXVSfurgcE+iXPeGrxkPZAM7j4CoMIdQk8TJ2DoYR8rxnaFLsT4+uno4Ho5BNbGwskuK4w
	/BkPP6cFtKr6dLVzsrK0mWhI9YZdWkyme3PIMgX7vFKV63kgRRIRiHXtC4KcshCLu0BvTgRw+9S
	gQl6Dyus4844zkXSnaTTpq/GRWgQiw0dDqP5U4hKVq+qcsWRlq2ngbjh9uW5zb2rJwrfTRHhDgI
	naAbKws8GcWuAks7KUtYBZiHeVG8aDjeCa56HA77ZoYOlM5bK3yL6bnWiv+Q2XpWDdKM72eAKUf
	MS231U/LJUbRUuHSg==
X-Received: by 2002:a05:600c:c16d:b0:49f:cac3:c68a with SMTP id 5b1f17b1804b1-49fe66f9ff1mr251267355e9.31.1790677719072;
        Tue, 29 Sep 2026 03:28:39 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfb479asm66579305e9.15.2026.09.29.03.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:28:38 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 29 Sep 2026 14:28:19 +0400
Subject: [PATCH v2 2/5] dt-bindings: power: reset: syscon-reboot-mode:
 allow supplies
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-b4-rk3576-reboot-mode-v2-2-5a34ca72065a@flipper.net>
References: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
In-Reply-To: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: Alexey Charkov <alchark@flipper.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Shawn Lin <shawn.lin@rock-chips.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1537; i=alchark@flipper.net;
 h=from:subject:message-id; bh=QQGLNQvdHfru03RYinWVR9vfNnySQYKGE1jNzOfXc3U=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtnnTx1Oz7jZ82Be+vas833B3yclvwKsWj6+zvTJzy7
 ezV75aMGzsmsjCIcTFYiimyzP22xHaqEd+sXR4eX2HmsDKBDJEWaWAAAhYGvtzEvFIjHSM9U21D
 PUMjHWMdIwYuTgGY6p/6DP+UGuJyZT8kqW4WFf796lPHnY0+KwQrdB5kcL7fxqwUEdDE8M/I7Np
 NSdvgt7NEXh1LbsxIXixqctRkZr9Q6hGeo19OCvEBAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Whatever program that acts on a reboot mode runs before a full OS, so it
may lack the capability to enable the regulators it depends on, and a
reset that preserves the mode register generally leaves the regulators as
the previously running system left them.

Allow a reboot mode node to name such supplies, so that they can be
turned on while the mode is being requested.

Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
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

