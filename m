Received: from ironport.ite.com.tw (unknown [219.87.157.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848FC363C5A;
	Fri, 16 Oct 2026 06:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=219.87.157.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131341; cv=none; b=Gv4vLRm9JwAQs3jIO6hMe/pn0iMuap+VkaKx7+j2wWKxvoZmi+SbTzwQZm/63opn7yI6kkiIGyyACijLNd3I0CJcy3G+ATQF4ckcO31de1GojflqwkpbJBS5nmZW7tBj5grrTLGVvl1WbhtjKQClbuk0z9B1htLiVsFyIsCtbtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131341; c=relaxed/simple;
	bh=JD4dROF4bzxBT3bZ6QhVuLQLMFjT86STqAH5Z1ceIIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S0iP7K+rLH8dTvyqc0RzR4RQMV+5HYsEB1xDb//nSufM4Y3jAYVF4CS5CVCyKpA1nkv3YZxd80k17InwE1sdJD/2Cr73rj6LiKdG7AfLAHVKzYyqPjpBp56OOEijfyXyBAF393c8vw5EwWVSwVl8sxpe8/fvRB0/PbCd3wfV5H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=qls25rlN; arc=none smtp.client-ip=219.87.157.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="qls25rlN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JD4dROF4bzxBT3bZ6QhVuLQLMFjT86STqAH5Z1ceIIw=;
  b=qls25rlNrc0BFEEXi3YYIkm/4fYyCW9kibohoyZHkKIVI/ApfciQnUUD
   pZkuJIdnujKnqKxW2erYrvJT+gpPispaE80DlH8PGmxqqxKQvA0T6nRsh
   SYEJMeFYOGcCq/rfL0RoW9tOci8RQ/y80z2PMIT0ueaU5Iv2ckAljQOSE
   7aWzTsPVlK87LnLsEc4oshDshtbIUSIX33qD+qEeg1ACWtvbIAAtYhHVK
   6Ts7JgnNkjbS4j59x5pr/xCYCb2QjCrBXzLm7aA8MxB2n5k9S6kDEmSWB
   WHrOzEhtZ2SD8vCCgYazq7T3kKA1UZK33LCJI6EFFPo1AE9FqJTL5iQ/C
   g==;
X-CSE-ConnectionGUID: ofBWlz6nQUOAigQGKLszGA==
X-CSE-MsgGUID: T5FHnHfRS/+810YF0SW7sg==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 16 Oct 2026 14:12:14 +0800
Received: from jiraproxy.ite.com.tw (jira.internal.ite.com.tw [192.168.35.200])
	by mse.ite.com.tw with ESMTP id 69G6CCJ1070067;
	Fri, 16 Oct 2026 14:12:12 +0800 (+08)
	(envelope-from ite_pd@ite.com.tw)
Received: from amber-VMware-Virtual-Platform (ITE01791W10.internal.ite.com.tw [192.168.37.107])
	by jiraproxy.ite.com.tw (Postfix) with ESMTP id DA4832F04;
	Fri, 16 Oct 2026 14:12:12 +0800 (CST)
From: Amber Kao <ite_pd@ite.com.tw>
To: gregkh@linuxfoundation.org
Cc: heikki.krogerus@linux.intel.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeson.yang@ite.com.tw, Yaode.Fang@ite.com.tw, Bling.Chiang@ite.com.tw,
        Eric.Su@ite.com.tw, doreen.lin@ite.com.tw
Subject: Re: [PATCH v7 0/2] usb: typec: ucsi: Add ITE IT8851/IT8853 support
Date: Fri, 16 Oct 2026 14:12:53 +0800
Message-ID: <20261016061253.4709-1-ite_pd@ite.com.tw>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807-ucsi-itepd-v7-0-998ac11ed0ef@ite.com.tw>
References: <20260807-ucsi-itepd-v7-0-998ac11ed0ef@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MAIL:mse.ite.com.tw 69G6CCJ1070067

Hi Greg,

Gentle ping on this series. Both patches have been reviewed
(Rob Herring on 1/2, Heikki Krogerus on 2/2).

Please let me know if anything else is needed from my side,
or if you would prefer that I resend it.

Thanks,
Amber
