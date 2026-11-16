Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818510;
	b=ACVVK3IMERObgcPaif0Qfe6q3LmMperIux+m4Q+OdC0YafkW1/+9pxpJw7/JyslYbWeX
	 cZMLcNHpRYIf0yT4GMmEtok7nrs5iV5BfoRVs/t72oQRcyjFIMH/ng63/Iv5pv08IND99
	 uZVHd3z3qhV+Q0Uqi5/fZDjaRR12N7ANx27YMyJ/BCQFSSdjDsrsq0ppE7975d9EMmxeD
	 9tdNJ98yHOBtiZKDbPeT3yVgrFBtpXC5Ki8b8mE0Dbns7YgR7Eu0eWR+UEQcLyrBZjNih
	 8PWz9xU+rdhzXH4AWzTj5Xni6QfNoO5KyWw85h/zHHiVLhY+jlC2SeYoo+9lUtjSIwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QAnazgbAEbBUyJvl2IrarULxEN8A8O9+J2KxABxOX8o=;
	b=EZX4ou2HzVVelG6GXz3sXz+YpQ17RWevWGSDoSNUqKEiX3Nb2+eyTl1Uz4rjaDwtIGo1
	 j2opYa/B3N4PY+9q3kmuIy68eV+sLK6ESTPU9XzM2c9OpG2R2FU6c8jf5UvJ2ddBQeDE+
	 ReILMMvvOIKLTTsJmPn70hEvvYCeT86z+LFiPXyIO4kA5MIj4+dGIYjnRMs2SmxPMJsu5
	 mhCoPM3pbcHRDtBy9amWI1t5bxTd3blf0IFFyI0zFAKQIWqFTaH1b2255jj6tM4wIHIHv
	 agUVYz5DrCedpL/0LlfFI6h57F+l1Ykkb5F5oLkhpzA2TIwwv3+BGbFO2xJe2rfcdpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wd16GRgR;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AA6606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69AA6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wd16GRgR
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso7456715e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794818509; x=1795423309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QAnazgbAEbBUyJvl2IrarULxEN8A8O9+J2KxABxOX8o=;
        b=wd16GRgRSa7VO6+SybNxvyCo3e+ypxaoEE943KTIsD/URI0L7FNt5Y1QxdgztsIbzP
         vF20g6P9Ktu74GZMlimq0HKk+vWaEwle6X4Svezwg4s6RXBYrx8S5z74domL7lWnZp1v
         /XMRjxSCLazvCJaMC/+r+zmbSmeWpNmUanwHqyrECn6LRLebioR7kYeyQ4az0mgpDkJ/
         wRREOG4SCTvGq7W7qQSyGbktgz+TJLCZ0QdACr6bLtQdcj5lBieMVBPjEwV2ycuHNLch
         mN4WLOER4fz3sU/0HEfVHSC17CBGoVwI9r3N5DycUvO3wwahoUbNbqP2Dp6ogpE46k7n
         IyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794818509; x=1795423309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QAnazgbAEbBUyJvl2IrarULxEN8A8O9+J2KxABxOX8o=;
        b=0VIxTP4WCsS5Tko+6ukFpuMZ41Th+10+w6RLXJDdAtf1xgJU7E5NblLwfzq8s1IZMM
         gheXvfeIM/z3Gd2o4EjY7dslKjiNzh5mAO5U2F5u04e6Wvx59ZtXBWHKX2kSSDObiEne
         /yiu7QEvMN9btqGFaToVvmUKzm6V6qvPBawIEFXFqaMtBpThQzfoit9y0I+fBrbd3CiP
         8ux3xCXyvw1SfVuQwpnzJ1l7yVlPMprlq64kv/QgznPUhgoiJxuk/6BpYtwE64odY1pp
         Br8gJFTwWhuJ2ZtsbmGUmBS56sf7FaFxjGdvl9vDDasJI6zntHCRdQW4pmtRkE5IlKPT
         7X5A==
X-Forwarded-Encrypted: i=1; AL+hErG+9ZoI9uDbZw73MSSUt9p17HBjXZXh5ylDqI6kxoEzJwXNhI4mXwJgSnuglfDs32rdUqsPMPWYjrFR2dc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bFl+YovN0CVRA28nuKzHfuVIoiFswIJPbBF1lV+zIDEsBnhej
	vnIcpha+N5WFrxYiezoWXb4lqeKXw1H5vbRRKMq87oBGVCkVeUE9r7/ScpSQQKUk1A6qsA==
X-Gm-Gg: AYBFou2ndcmmrdfz5/HxTwJtwOELpT64EwdtfhVUTihDe+Vy4AqMhautfrVSvEWVGyg
	X/WmEnKQjnl5K5vX/0VNjRKzsvTmyvL6VYJE99S26wzhngwPLsIaYWkjBeShzfkqKC28thGku71
	xMWEto542zUDmsU3GUKraM++GEMULNIiydCis5o/mij931zG0QKwGnP8lSCKhaBt4Fb+OAoI3Y6
	xxMtpT/w6fxDW03rtEIHxttGmpZ9+Pvd6cnCEuXJ04hPjAmIHxKIC46hve3IvB5M751a8+okVoY
	6NGwu2wFDXpJPUnAdz0mR2dqF6t+cz91kneat6eK7sogbaubnVWuAch5vhRHtukVkVv/d0gaKJ0
	dRrsa9RpA5mIRBqNI0F5QxmyYlp+8lQCSoZi2kbjEjCKl4hLQrp4E8wS+eW6lYz3hExw4+OyMUt
	o9Kr4oCbUSOFaHrvM1huGLLGMfx0UBGRq4dPJR2rokwff0ykT1eZC6lJnX5EFLHhUSM17SAp/Rn
	U0G+gamkT4krzIE6hjfZXRJ/51a9lQxfbFfRGeubRNzcMBWDRjC47R8SET8jMjKpImFfTLHDybh
	WMilqR4QkuWe7zG8sPrW+s0WoX5rc/2QHrZ6oUuOKacayeUSJbUotT+SfEqXa3chviS8moxg
X-Received: by 2002:a05:600d:6409:20b0:4bb:6fb4:586d with SMTP id 5b1f17b1804b1-4bb6fb45a20mr42466605e9.0.1794818508748;
        Mon, 16 Nov 2026 00:41:48 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.221.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d5ec30sm284300555e9.15.2026.11.16.00.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:41:47 -0800 (PST)
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
Subject: [PATCH net v3 1/2] selftests: net: veth: propagate channel-check failures to exit status
Date: Mon, 16 Nov 2026 09:41:06 +0100
Message-ID: <20261116084107.6675-2-emmaonana18@gmail.com>
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

chk_channels() reports mismatches with a "fail" line but never sets
ret, so the script exits 0 even when channel counts are wrong. Every
other check helper in the file (__chk_flag, chk_xdp_feature, chk_gro)
sets ret=1 on failure, and all chk_channels() call sites expect the
check to pass. Set ret=1 on mismatch.

Fixes: 1ec2230fc721 ("selftests: net: veth: add tests for set_channel")
Tested-by: Tianyi Gao <tianyi@cloudflare.com>
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/veth.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 64c2a5a59821d..5c1dbe1516bb4 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -130,6 +130,7 @@ chk_channels() {
 		echo " ok "
 	else
 		echo " fail rx:$rx:$cur_rx tx:$tx:$cur_tx combined:n/a:$cur_combined"
+		ret=1
 	fi
 }
 
-- 
2.43.0

