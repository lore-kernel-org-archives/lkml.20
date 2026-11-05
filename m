Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869865;
	b=Jbgpw4uDTr8riYgZy8qyUHNCR9PnRjhhdEY0vePzCuUqf7m3bG3Yq93ah0Jjp2A49ipS
	 u1E8k3XuLdOir8T9BTBiKLnjnZfv1t40RiNb+IdoIEfJZ60OpR8QKXtmcWEsndIugzvfd
	 OSblttHN5PckCFzKb7/TWJpvNDO3CBv4AYURdM3jrcVb9GdqE8yhXxa8zDlL6kgOw98kq
	 vvb+imz826Sx0k6Rp4FLg10Zt9spp78Cansanhok878P0pSkh001aHkDhS4MUCbgznMSl
	 jQRq/x26iFtPD+fZ6KlFTUhqRYERZKC0s2+lCM/Tm403g6e5PrYUImvWX0oZNMzvHzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869865;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=4+ZqNO1Uua075MEzu4+jAJNvV66dGvERxAz2lyx10y0=;
	b=TVwdPflIwkDHEjfUyH+wir93XUlnQwxTcrjwhl5T2+UGmx4xhW4zfPz0xm8IsOXBA9Qy
	 aPtkMaD6+Hk/7kKUOksCD3p9gitOG7zuiFzRy/a4KDGT5mpbDQ5KKf0pQxieDOnK46mu/
	 R0knMyBU5ee5dvFVjnSq8iPC1AmhPXsYRQBd6rLgY/wahbprrawUWsLVA/dF1FCfVXkuz
	 nBqmkCEJi2jSKiIebS6x/Uxc67pLw2omVIzphNKhYQ3RNUdBwd0KL79BsYk0x7uhuyqTi
	 fJCt/rs9CMXrBKxC+vHMbUhFrWNjMwlevonXVZVtbtzq8rpWhzaSlBhGC6iiBNLUGlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UUyuMllB;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C32606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07C32606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UUyuMllB
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso1084523a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:11:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869864; x=1794474664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4+ZqNO1Uua075MEzu4+jAJNvV66dGvERxAz2lyx10y0=;
        b=VKzXm0L4D5NahQn3+JWlPDArJJ6RC4c4jf/Gg4sxKLbtT5C9NkLjmAg30vMW1b+bE2
         bZPXQmNTZczn3pU0PapzTLky6lUPNLWorUcNac6B8sV6TM+awEXuj2WWq+CJrCicQOWU
         fHcODhiv1/jgrwAvvOP0SuINHWWC4oNqBxf5WpIcWt7cOw4nYuiTAWjsTqvcxBpQfxM/
         wfLijPPKY9APOm6mUVKlBY/9P3HheS0a1bSNAgxdq1qxznYWWihgZvVQqWPxl0OmMElJ
         XUa2K4Nb7Rvkzs3iy971l+P4UXmugpo/xQ+noDX/UWpExSavWdMlakWnm7TOzMij4MCb
         lOBg==
X-Forwarded-Encrypted: i=1; AKwUvBxs5F/Mz/3SA414eniChAAu+5FQZKxx6DG0jtp1mqiw3AxtuJB2EZobctXuAExGDwnKcLpElN9hQ9AS+JU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XVeKGqLzhujb1cqGG5SUdGaiGGDIEkUOs2bBtujNqYaaAd//o
	3uRcqEEuecLLymyF9BbUZpk16PqL5MQn4GprZw7nhg900AmR4Jzka31IPBbt3ZnkBaovmc41vxM
	af8SJdj+D5wBPcqs6EKQqIgRVcgWsEfYAQxQDDF9aXVZPXrpoKh7DZcYVVgm0T/69Xn3Qnpif8u
	AN4+voXRZ4HZIWcBISXnTRJPIzAKRhg9x4zWnZ39BKmd+ekfpd0D8qlYtTqA0hhR3wsxrIqP8vB
	QmpwqLoeuSU8X9zcA==
X-Gm-Gg: AYBFou1VKFY8EOkHnvTHYleTwQ/98DLCxSgqPfrW0Ek0t8y6B7UG2WQMh8/L3aJnZT3
	+CJ7Y3rSRLYqgCTfjoXlFs0DyuCbHP6qryxH+kWdnXL+8FxDGwCJlwH9KOY5mKgeuxDixYqGfz/
	4WHGZCfAwecucPkhuxby7niQNO3rdtWZj5MSsw1oyfgEackQtnuPHAIM8vSsVWeixlz+77+qacu
	JTaLdASk/NmysJRloADe48+nMkuSIc3ArqxCjOXZZl3Kcl3Iiil3Mmtn8XUFtPcHFIhhnJEzGIV
	gtd6AZOI45+babDM4Y8rodHCd+UJuE5pKFxqox6RRqsSWNWAZ5/honL9hQGoOcV6GnknT/EW+9j
	dlQl6oScIPSGUj4lpMnU+bB5iQ3XcG4NsBeGlpkunebfKLVuAjtTkM25t7W2VfZd0+wKivS8QGQ
	+MVfQG+bSUkUUKqAiKJME5PEuP7VyzY8+gjQ==
X-Received: by 2002:a17:90b:3194:b0:3ae:a4fe:7ad4 with SMTP id 98e67ed59e1d1-3aea4fe7dd4mr9234770a91.2.1793869864325;
        Thu, 05 Nov 2026 01:11:04 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b0b315a756sm1495542a91.2.2026.11.05.01.11.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:11:04 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-535066512b0so46152641cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793869863; x=1794474663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4+ZqNO1Uua075MEzu4+jAJNvV66dGvERxAz2lyx10y0=;
        b=UUyuMllBWNBMjTXRRyz6Qq4H52mR0Hs6nSMXb+lB8GRVNLKQMVBrig3wiG9HGZoBe3
         Dq4PcCK4y39gG88HV2JIJ6BdIEqra5PL/gfz5nmgW5pzEQ5k4KFkjLlDUpFMgt9TcMyG
         bQTdkTSUeB4ashXuB8cm5+i30COn54ZyzFqK0=
X-Forwarded-Encrypted: i=1; AKwUvBzxlNVBG34Bu9CZhJ6n8mDZrMUORlZNo5j4757rZapBSINUAN39gIIB7FF3gxAp79Qctl6pbb2iQ57eJ/8=@vger.kernel.org
X-Received: by 2002:a05:622a:1a97:b0:537:b9f5:e05 with SMTP id d75a77b69052e-542b82fa50fmr318543391cf.69.1793869863171;
        Thu, 05 Nov 2026 01:11:03 -0800 (PST)
X-Received: by 2002:a05:622a:1a97:b0:537:b9f5:e05 with SMTP id d75a77b69052e-542b82fa50fmr318543191cf.69.1793869862721;
        Thu, 05 Nov 2026 01:11:02 -0800 (PST)
Received: from mgmt5.dhcp.broadcom.net ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b100af507sm47298591cf.6.2026.11.05.01.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:11:02 -0800 (PST)
From: Siva Reddy Kallam <siva.kallam@broadcom.com>
To: leonro@nvidia.com,
	jgg@nvidia.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	vikas.gupta@broadcom.com,
	ajit.khaparde@broadcom.com,
	dharmender.garg@broadcom.com,
	sachin.holla@broadcom.com,
	Siva Reddy Kallam <siva.kallam@broadcom.com>
Subject: [net-next v3 0/3] bnge changes for RoCE driver
Date: Thu,  5 Nov 2026 01:01:51 -0800
Message-ID: <20261105090154.1293846-1-siva.kallam@broadcom.com>
X-Mailer: git-send-email 2.43.5
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Add bnge specific changes needed for RoCE MPC channel
support.

v2->v3:
- Addressed Shasiko review comments

v1->v2:
- Created pull request for RoCE MPC channel changes
  of bnge driver 
- Addressed Shasiko review comments

The following are changes since
commit 05441d697f7f ("Merge tag 'cocci-7.4-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/jlawall/linux")
   Merge tag 'for_linus' in Linus's tree
and are available in the git repository at:
  https://github.com/siva-kallam/linux bnge-roce-v3
for you to fetch changes up to
commit d60317882851 ("bnge: Reserve ring resources for
upcoming RoCE MPC support")

Sachin Holla (1):
  bnge: Reserve ring resources for upcoming RoCE MPC support

Saswati Das (2):
  bnge: Pass BAR1 doorbell mapping to RoCE auxiliary device
  bnge: Update HSI

 .../net/ethernet/broadcom/bnge/bnge_auxr.c    |   1 +
 .../net/ethernet/broadcom/bnge/bnge_auxr.h    |   1 +
 .../net/ethernet/broadcom/bnge/bnge_core.c    |   9 +
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.c    |   3 +-
 .../net/ethernet/broadcom/bnge/bnge_resc.c    |  56 +++++-
 include/linux/bnge/hsi.h                      | 161 ++++++++++++++++++
 6 files changed, 224 insertions(+), 7 deletions(-)

-- 
2.43.5

