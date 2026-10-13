Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A1152FE39
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914060; cv=none; b=cmRxUWnmJDzv3v5Z8lSFfTnrlFLAaR2/S9GLFzfaywNQHdKhClWueJfWWTs6j4fdFaZ4J9+oS8GSdOYsdjN9etvQ/9Wm+ONnsJjbrpc9FW8X87Qaq4fUoGzna4LvUlHQy2mUOEqkWA/dl2gIphpn4AblG2u8OOWlkB3OQY/srX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914060; c=relaxed/simple;
	bh=dNt1+qDVTfl6ktB/h7JsBcW+Ebvqf1bzmkgjO/9Uzls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qu+q0hSOOmeED5JutuTX7CG9qe+HaM1EFldDm0xoDbwoU/B/iL2Mh32TXxWkNBXp0KkNiIoGgyL2fTmRwHgiZgPO42ikcWXnkoHkAxfyrRODCF4si7uZis9pH3TpeBPs+COrN/Pfs3obNSMxCO69WKJ8s/HakcHrGFtRLRaWhSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=efW1SWXX; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="efW1SWXX"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-141395927feso6264375c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791914058; x=1792518858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TeLrBjGYw2bprIrCl7/DC/0yhw0Xu3oRywspw/ye3hU=;
        b=efW1SWXXR39SS29Ix5tiuVPMmzYRqMbhIlsflo/TqOxGUBrm+6aOxq7bAEscXZf8iP
         QFT7ALe1NccTR2WTGpXI9YOuvelkmOS77C3tMuqtvzi4JJun9rFIy5Rzw+qYJW5IAtDN
         DJZdkAWzfp3Yyc8idBNbp2hNpe4vNoffx+0D8GPwCnVpcSmRxEG0y6mg0PblE+IbKkeg
         j6S0/ZIgqeIPkIOp6epTkFbbaZjDqVL2WIc4KCqU9vBHBmtZCPDLIj0QgOT573VFQlDK
         qbmG7ycrN1Y0sKruF/yxrNxA3GBEDBxLAZdlJpBxHidrj3HDYCqgyJiItpIkw4N9nJBl
         vCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914058; x=1792518858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TeLrBjGYw2bprIrCl7/DC/0yhw0Xu3oRywspw/ye3hU=;
        b=oNiy+95nQ64pXS6Yb0fzbDRCYfiF3KeNryC55mIM+6UzlVe9g5L9SZcrxccDtCXnVV
         LsYwAA4CNbS/RpDXEKpTnVnRj2Thoy05vKJxVVmJk6+in2c3equTadXnelTVZXjbOxbK
         ayFJmnd559KKyW9vcgRjNfZbyZ4xVFsOJieuGtE4zZ2ZPCK93KJ2HjiTMPutIalQ2f4A
         0WT8+GKW5YQFGD1bep1eNdNVZMTXFlzOrZ6huvx13CCxQrGVX+b0NiqQ0IvlkKO2vM2q
         ZnpvgwLYwQ+MMxErQyz8Eu5a0Q++EuSGBtFOD5t1FhvxsPdlOFaV2rh2hQNRxnulcORj
         +Guw==
X-Forwarded-Encrypted: i=1; AKwUvBzq8RHjW5vEP/aIPoBqXxr5ARSUSIabbaniNocekN21hcNubMjKg4VXpH8bHBOgIIP9FXr+OoOLWmsUyMc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLerQ4g0hRlLALFmd+RPAZUF37IRLZHOXR2AZqJwgLSy7YeFFQm
	yZ8jzPw2nRTwx3cTsKafSFA87Gx1tHJ/A6HPnox9Y0bICElH135IxLu4d1Wf4yuY+wX9P0U8CIr
	0BUf1Suv8E0fx
X-Gm-Gg: AYBFou3x3WZ+MOA7PUrjyZDJFuAEii8P4zhozATYbGOAUNTrb1ZVhtkBwMO4e+abwBT
	y29Sb9utCUA1zuOSmkQjPaeax1VRNA8EQFddjkxKrRYqHRBTKiwj44cKng8uQPOYy3EQD756vXj
	+JW/D3AqBlMTD+7e+6l5vZWAfYZi2ybok4/C7ON0YtVkxugevnDyDSBGoKKY6fZKmZ51OOqODiq
	8nigxUq3T9R8RUZAz93HJ1dOQ5xwuAICgNdJwFAo3l46Z7TXubrHdcVdiO0CHwBxy4cI7mL8uv5
	9lOUfk3FoPjatmIClRXeErV4fv8ZY/mrY6ppC9o7Uc1JHYYAe/V/zo7csUgoe+cz3i3+wST/SSz
	/hT2ABEqGLFd19e0JdGb12PI/oFZLqzjLika5MWu4cYDd55MfFqVTSC1EutuotocfKJKL1rp/Ti
	LNdXW7dQHwrKPr8i9s8DQNADB6g7zZh1rCrdrlJOnamm07l6PFHtMWku2lDKArUkiRmXmi9ei7S
	w7aKWNNXKg/HAalIjLZ47QK2Sq3ldPCLQEDynmvB0Hs7ye35yoCqasqKNRYFWKPNEJu0RHDP6A=
X-Received: by 2002:a05:7301:e0cb:b0:351:1e3f:812d with SMTP id 5a478bee46e88-3537e0caeb8mr16505272eec.36.1791914057700;
        Tue, 13 Oct 2026 10:54:17 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm50183362eec.17.2026.10.13.10.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:54:17 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net v4 2/5] amt: reject a gateway Query or Data from 0.0.0.0 before a relay is learned
Date: Tue, 13 Oct 2026 17:54:04 +0000
Message-ID: <20261013175407.947606-3-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013175407.947606-1-omar@blockcast.net>
References: <20261013175407.947606-1-omar@blockcast.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A gateway's amt_rcv() admits a Membership Query or Multicast Data message
when "saddr != remote_ip" is false.  remote_ip is 0 before discovery has
learned a relay (and is reset to 0 by amt_dev_open() and when discovery
gives up), so a packet whose source is 0.0.0.0 -- for example a
0.0.0.0 -> 255.255.255.255 broadcast delivered to the socket -- satisfies
0 != 0 and is accepted.  With the nonce freshly reset to 0, a spoofed
Query is then taken as genuine: it sets ready4/qi and the response MAC and
suppresses rediscovery until the discovery timeout, and a spoofed Data
message is injected the same way.

Reject both when no relay is learned: a 0 remote_ip must match nothing, so
guard the check with !remote_ip.  Discovery is unaffected -- Relay
Advertisements are validated against discovery_ip, not remote_ip.

Fixes: b9022b53adad ("amt: add control plane of amt interface")
Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 530650d..e9b1a45 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -2860,7 +2860,7 @@ static int amt_rcv(struct sock *sk, struct sk_buff *skb)
 			}
 			goto out;
 		case AMT_MSG_MULTICAST_DATA:
-			if (saddr != remote_ip) {
+			if (!remote_ip || saddr != remote_ip) {
 				netdev_dbg(amt->dev, "Invalid Relay IP\n");
 				err = true;
 				goto drop;
@@ -2871,7 +2871,7 @@ static int amt_rcv(struct sock *sk, struct sk_buff *skb)
 			else
 				goto out;
 		case AMT_MSG_MEMBERSHIP_QUERY:
-			if (saddr != remote_ip) {
+			if (!remote_ip || saddr != remote_ip) {
 				netdev_dbg(amt->dev, "Invalid Relay IP\n");
 				err = true;
 				goto drop;
