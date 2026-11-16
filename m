Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818524;
	b=4ewGm9TE6PWM4Ki+zhi0pR3bu2cjt9GcLp/El+XkQyehjdELt4rNhM0MoehFCw2/oJKE
	 xbeKiWSPRd8HnpSgURjtboIZLOmTT37U4ARr55cxq4GRD1KNe+lqh4hNT2yD5wEqYPKzf
	 wwxXbmf/FPvQNb12JPCK2+sVZnEwvj863SSouyyi03P6k1rj6780+kZrUBCYaw9GlbXtO
	 UWRn4kvvauGkAHYpsHpgIn6gdt+vptfcgIkOcj2WjgK9VAQQFhgKjkjsHfU7ybiEPQXoD
	 H1LjthovEXMtAlwm7tJ1Bj3o4O+RqodToQyRVe35Q41Hf10fXw7aFmKTTOOYKMNyDig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IbDW2yfp/G8HBG/wT9ipOeQ5Z+TwPor4+SUJgaV0UTA=;
	b=h564XPl+UBCt86gEbO2v0k+fzpwgcKSDpWaTFYdiFo7//ZqM2n8BdhpuCABah54xEroY
	 AIPie7VO/Ih+lCy6fKgbJlTYesaBK7lVrFX3TzHrQGuhodphACALlkPSezBJvlksXamv5
	 w9vgrLcVoVa/8/grZrCrAHjqnFEjddbVBLVA+9AHE0oN8LC5vEMg6c+zh+TPFG/iBq0x6
	 vcOs1UeIkPHR/XvSb8Maluto5+ndvtTVyWSNtfrMiCuROKzoUw6kZcghQjZGZpWGdZb8B
	 4onc+CtXgLEWj4tC3R5F+gcCq5h4WKHcz0I2mK+zmr5wCFlq/NX6CBySJ3qky8GCx/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZoA9pBn2;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB66606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CB66606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZoA9pBn2
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso7457145e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794818522; x=1795423322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbDW2yfp/G8HBG/wT9ipOeQ5Z+TwPor4+SUJgaV0UTA=;
        b=ZoA9pBn2SaQcXdbdTbDGdUqkVqrFSWt+g1wynpHCOei8Q80uX3HN3uHnYFkli9EpRG
         32eCjf+w9PF111gI8CFo/2Fi6iAE8awhIK8ghCdj1w/Z5crBUJCEdB83o/LRmQazFxCj
         h5RvnVii23vtsdO+89HmwI8+MkPFeZOKVW9+kNYlK7TFWubhLKPo5wYsAhYf/4RCkI1T
         UoVlloGuVEBvVpV5t3vXpqc9paD7z+rZ0msoiFb0TefH5FcBOiGaSkEvImmecOZo97oE
         lJpXf2p7y7H1i7zqcUPmiYhnOp7/Ab9yXqGHGSu6bD6g4r8JAACBJYaBTBaZ/1hZOsdg
         BvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794818522; x=1795423322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IbDW2yfp/G8HBG/wT9ipOeQ5Z+TwPor4+SUJgaV0UTA=;
        b=CH1cE2SXH66z62gE+NAm2spBQ2Oky3BpBN9h4A+Bf2Drfg0KxfDIWgCs9bhrWDuOQP
         r8/zKkvL0IxqL4zNaYEey5a16aoXCWw+F6tntbLSuQO7by5whNmehAuP/ofopYgcJgnW
         H+8fKJREnTy4cnV268EyoTYYmNbrDyhJmvRwDffr+LRlSYsy6laZs3hmmaUUaqTBPv8R
         vsfAm0fuluZfFUjvK6pAxPSKlfIMBoEanXkfnLq1AoVsA4bBluMRYg/AsrIpo4DAJAlK
         X2HqStMn4YS2713LeX/AM0U138jPh26C5VTfGhx4yyoDmTMb9uaO8YYwxIWPDo2fE4CV
         JpQg==
X-Forwarded-Encrypted: i=1; AL+hErGhUEU1bH0cAxxeNPbjklxrhfcBgXzggtpMo6YFnPeHqyIafPVZNGiKAzxAWOubDLlaW3yxx4nkM1roUFg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tot5dcfyDz9HHQcshovOjOqoI7dGq0ClhVyqThoWnaMkAMjRc
	6/3Xuyz7ZYn5h1vkfrQO5VdsLMflMX5MG4N/+hDw+iZJ7ps7aqqW5sge
X-Gm-Gg: AYBFou3KKEbhbTYdkXj6CInFGunGro4U6zxoinPsW0rSVeKN33VPZPYNEcAwtcQ5j7v
	X7oZ49EoDDwMCM2bir57+yxZIWtW60VR5kz3WxsBqbBQMGDTLaqbh1erZ1akEAgTpI0nTmkKiF+
	HIzRqXyebT6Ev9vwCXwBjOCWoOH1tKfjfSd8uiApvDrKQWphHJ3Rw4f6SGpHgzISaXg7reoHEEF
	dZrM0cJSzCpjABjOl3o0Bf6nGgaBvxnUWaAjc0M2mkNpCvCiK2vqLo3AZtXtBVSVsqcVHWJ8m5F
	sNi024rJaXIU468X6C6rnlaMmhH/R3lQOlr7W8vF18huQYthtShXsv+3bmd9dtIhLNeo3wpnbvj
	fc4zxdLZye7URXAEYL+hW7dWQ8Znvu3NBsgVVjSh3VSK2H22xS6nhXU4BTteEiLQE4zPx1Mwdwu
	uesfkLjhw84AHj1G3yvVIoLH33an4cvkb7qILjsl8If+k16HnQCn4xlSedyPQmD1Ky+rs2033p4
	MLMAA+Ebn8JkdO34t6dR5Q1G8rKFW2QieGSAKaNdULse9R/M2IIIISVO00WsoKeq2pl3MWgXNma
	jiM2c6fQBpcSlNfufhYKMvqvXdl0U4T0owRHsr6WtNcS9TbMOApS3YWBaEbIl+W/p5S/LreINnr
	13fCFsgGNpeNPV6R9s9Y=
X-Received: by 2002:a05:600c:16d5:b0:4bb:732a:2837 with SMTP id 5b1f17b1804b1-4bb732a2af5mr21460175e9.1.1794818522364;
        Mon, 16 Nov 2026 00:42:02 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.221.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d5ec30sm284300555e9.15.2026.11.16.00.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:42:01 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: Tianyi Gao <tianyi@cloudflare.com>,
	Hangbin Liu <hangbin.liu@linux.dev>
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	kuba@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net v3 2/2] selftests: net: veth: propagate bad-settings check failures to exit status
Date: Mon, 16 Nov 2026 09:41:07 +0100
Message-ID: <20261116084107.6675-3-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116084107.6675-1-emmaonana18@gmail.com>
References: <CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com>
 <20261116084107.6675-1-emmaonana18@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three more checks in veth.sh print "fail - set operation successful
?!?" without setting ret: "bad setting: XDP with RX nr less than TX",
"bad setting: reducing RX nr below peer TX with XDP set", and "bad
setting: increasing peer TX nr above RX with XDP set". A kernel that
wrongly accepts any of these invalid operations would be reported yet
the script would still exit 0. Wrap each fail branch so it sets ret=1.

Fixes: 1ec2230fc721 ("selftests: net: veth: add tests for set_channel")
Reported-by: Tianyi Gao <tianyi@cloudflare.com>
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/veth.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 5c1dbe1516bb4..0b173beed3442 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -474,7 +474,7 @@ if [ $CPUS -gt 1 ]; then
 	printf "%-60s" "bad setting: XDP with RX nr less than TX"
 	ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} \
 		section xdp 2>/dev/null &&\
-		echo "fail - set operation successful ?!?" || echo " ok "
+		{ echo "fail - set operation successful ?!?"; ret=1; } || echo " ok "
 
 	# the following tests will run with multiple channels active
 	ip netns exec $NS_SRC ethtool -L veth$SRC rx 2
@@ -483,7 +483,7 @@ if [ $CPUS -gt 1 ]; then
 		section xdp 2>/dev/null
 	printf "%-60s" "bad setting: reducing RX nr below peer TX with XDP set"
 	ip netns exec $NS_DST ethtool -L veth$DST rx 1 2>/dev/null &&\
-		echo "fail - set operation successful ?!?" || echo " ok "
+		{ echo "fail - set operation successful ?!?"; ret=1; } || echo " ok "
 	CUR_RX=2
 	CUR_TX=2
 fi
@@ -491,7 +491,7 @@ fi
 if [ $CPUS -gt 2 ]; then
 	printf "%-60s" "bad setting: increasing peer TX nr above RX with XDP set"
 	ip netns exec $NS_SRC ethtool -L veth$SRC tx 3 2>/dev/null &&\
-		echo "fail - set operation successful ?!?" || echo " ok "
+		{ echo "fail - set operation successful ?!?"; ret=1; } || echo " ok "
 	chk_channels "setting invalid channels nr" $DST 2 2
 fi
 
-- 
2.43.0

