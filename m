Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA934DF4BE
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791397015; cv=none; b=l0h5fhTc9gXCJyLqYSXX4AyyI7QDHKxQ90gAMbg1Vbl1fqQftwYlqwiY/+7F59S2Vin90LgzerXo7Xr7M8JzcWVKYtpOAPmHGmsDsBa43jbUnZuceI4ta8aWiTuQ+JxcyamfZ72kV1WUzRhvGaDZP4z67vphRJQ6FwiRJKHeU18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791397015; c=relaxed/simple;
	bh=McO8YjXlypOeoX4QkYeNrhdO3XuQh8G3BcccmslsJYQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NC0kbb2YkBulF4pWZqNHZDQyYvNrKNh3CTUznddO1sc4anLQQXsP0WoDZ2+zp5dSJJ2427evqsAHIiXcpuMkArnENzPQHaA2s6/gt7m7Z/Ja+TCa2fu9jcwEQrAyvvlmRWDmsyyg69SrwMLpNqjUF2IL1IyjJLm2aibIbFYix5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=NG0LimwE; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="NG0LimwE"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-534e6545939so35469441cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791397006; x=1792001806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HlPhbKKLwkJ8jfy0wR1jO0OPJAX2t4fwgDWWxi6hd3M=;
        b=NG0LimwEZf7Y5Q0DifD1WTjpRfKMzv3GNMEogBoX8HRaO1DKFk4SNEf64XBbLcBJZx
         B2Yop5sClPKNstN72hNwbJC0RQMvMMQMGnH3sb+1zX1r1+BO3jm6gpOqu0YxJyAnCHM0
         1ZkGIFLub6QEAxlB73vYQ9Vp+3jYfqiBMoQb8ESDXTWqt3KL+DGc3kN2Y8vEddNC8CA/
         0hGEZN19zmIJ1Gk3VZCzDfPLdPA+AFU6g3tkPKyZsgeEq7cLdmbkLXwrZI2FAS1Hut5L
         IUje4i0vlnFHVSRULfaricR+wj+f5OiwEsnqEGCUm663yZq2O6Jr/NRDGuItN03vYpeR
         ZAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791397006; x=1792001806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HlPhbKKLwkJ8jfy0wR1jO0OPJAX2t4fwgDWWxi6hd3M=;
        b=n8+6o1UuEkNMYn6kkIWTsdtPhGiJ+arg8r80IX0gpUx7WuYp8pGNUpPdCWkKaHLct/
         dQnI22sWeyDFVX5+yOevr2sKGEqKCs3d7SbvNIEBoRcEs1V6AvTnqUTWiCfT68lzRudo
         g+5ypQ/TDkox8ZL0ACneuR+i/YYsszssgHqDP52+nwkUAcYQEbYAlr3STMjaogtIvtO/
         O97jC+L9N92KIG9wXMj+cAsMiu4UTDBMIHyR8+q8+6IeaS6z++c/LYEGR03rHLYaKwsn
         wqLLbxLdE4SimlzoIS6X2jrYG0442PMKnKmHymunjXykYFT1c62aSa1WirVXLudWYW0b
         9ZtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHujC/VSFnZnBS0tHccxAwebXVtxFGAQHLzQWK2H1WBwW+ZeQZVSUdLhYpBlh6LoXPZRy27ilxpZKkCfE=@vger.kernel.org
X-Gm-Message-State: AFuF++ntUBTIsxXGzn5KsaVB3bg45WMpZ7xJOrLl7XHaOY37gznO6sWQ
	x4MEZF3zm8C6S2fuoEpkjMqf5FFD973mic2Iu8avotODPs4qc6gAhB7SGDnHhdQnxOo=
X-Gm-Gg: AYBFou19JrUnfw4LTvvf65YVX3xP4jWhu92xu5Q5SS1dPxYQRea3pTAzZkhnPxfgVLD
	0ewvSYLR0ePF9l0Ovi5LfM8ebIrX8qr4Qf0BGf0AbVpTc527vbb8xRsiPIcVGHyLbyPYRMoy4o6
	CrbYTIpQnj3IICe0GWYq4FpgZwRvw21T8PqxdZD6cLyR6j3hYB4xXeVcG36HjAjuHLDi2ubBoG+
	4/klKyD6LhTj1BYzvDQLT0176PK/w9XDef/rkR/MBDwMkeh5MYqM7eqDGWKnSiG6GtbSUXO9G8A
	DBFJOK9M2ev4cpY7DxdnO7V0s7e/7EIM/PPBXeW/Xq4oC4URXs3l7ide4UnII+tB2IL+p+3svN1
	YnjvXDkTjRFaQQdxxDBlZTZkrySSPuoWUPGcW6ubHjBpVyPDU0qdm8BcPeNSd0bhUWKLe7imwl1
	kqGTIkr7+Mq5mrxVozWUPtk59EnG+zO4Vow32i+92FqweNuGWX3z2XHCOrIJYNYR5gC/AWTO8Mu
	GfqduV08CAIyKg=
X-Received: by 2002:a05:622a:4106:b0:533:3d48:37f0 with SMTP id d75a77b69052e-53575555c86mr50817771cf.47.1791397006325;
        Wed, 07 Oct 2026 11:16:46 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53572103ae6sm26011521cf.15.2026.10.07.11.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 11:16:45 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 07 Oct 2026 18:16:20 +0000
Subject: [PATCH net-next 7/9] netxen: use pskb_may_pull() to pull excess TX
 frags into the head
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-b4-pskb-pull-tail-drivers-v1-7-9512b0fb977b@toxicpanda.com>
References: <20261007-b4-pskb-pull-tail-drivers-v1-0-9512b0fb977b@toxicpanda.com>
In-Reply-To: <20261007-b4-pskb-pull-tail-drivers-v1-0-9512b0fb977b@toxicpanda.com>
To: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Eric Dumazet <edumazet@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
 Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Tony Nguyen <anthony.l.nguyen@intel.com>, 
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 Manish Chopra <manishc@marvell.com>, Rahul Verma <rahulv@marvell.com>, 
 GR-Linux-NIC-Dev@marvell.com, Shahed Shaikh <shshaikh@marvell.com>, 
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
 xen-devel@lists.xenproject.org, intel-wired-lan@lists.osuosl.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1791396985; l=1110;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=McO8YjXlypOeoX4QkYeNrhdO3XuQh8G3BcccmslsJYQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEER6Cf6YiSeQas1SDvrXyD48BT2JMKt5v+EgNKlM2X9W7DYLscC2uLR/v/alcS1X9KdG7G/jh6
 TE0kjRM5PRAc=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

netxen_nic_xmit_frame() pulls the frags that don't fit in a TX
descriptor into the head with __pskb_pull_tail().  It already checks
the result.  Switch to pskb_may_pull(), which takes the length the head
should end up with and checks it against the skb, so this driver no
longer calls __pskb_pull_tail() directly.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c b/drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c
index 67d9bf69f8f2..202deb64ddef 100644
--- a/drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c
+++ b/drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c
@@ -2045,7 +2045,7 @@ netxen_nic_xmit_frame(struct sk_buff *skb, struct net_device *netdev)
 			delta += skb_frag_size(frag);
 		}
 
-		if (!__pskb_pull_tail(skb, delta))
+		if (!pskb_may_pull(skb, skb_headlen(skb) + delta))
 			goto drop_packet;
 
 		frag_count = 1 + skb_shinfo(skb)->nr_frags;

-- 
2.55.0

