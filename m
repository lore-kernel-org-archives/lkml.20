Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA6B56B85E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790192058; cv=none; b=PtSCw6NeZ0YpA5g2cJq2MmBKmSYYnaHHXmG4bfpy25poQPnQQ0G8Cjsx4K/ULsbo/7TzYf3d/IVBWCIW3DoNM/7QiDAjgKzUJM/xcRGiryoe+wQfA6xLMubkz1ngSiELdgTSrQ9VEHQB2Onep6rJFFXbtsEpRtbT/SVo3wGZDl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790192058; c=relaxed/simple;
	bh=VgdVHZfb9ZqoIhcdj+YWq79Pk6RvOJZCncaSg3smx40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m52u7xkFZYEpE7zPRySSP2H6geP43jwrlovs/37B0OidPx80HUObqawfqIUR1YkXjbvZ3BhZ+29kjdJoMlzNSHJJo+BYNuZpTmvwsPaUi7usKqwwxtyhGQYFX3VRvnJalOUNH3k7aUiOUtQ7vE0MBQIdIpW9gwnkWiz9x0P+UJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MWTceuvq; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MWTceuvq"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e97e2c7d4so758736241.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790192054; x=1790796854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UA6HnleFaKMNeHtZg5wP2wOLqxj3WJzI/h2c9pM/vFo=;
        b=MWTceuvqqQ+kXTvt/QG4T18lnWdOWddLBlrIELOuND81U80lyDWjhhcbqUDRXeA3Cb
         mbsy2gXMLoA7iaWm0oZ531QAZncNP0sXCtdDeBr63wQPNlRhZVov9/UF3R1W5m6iGZeD
         fxIO2Ur9oS15z5IblCjqhzpEJhA6UmPSs2h1mi3K0LSafV6NOTQ8jl7Z62iAS6HCPbLP
         kRzBRT8hi0dCAI/6N1TyyScXw/6EJo6mwUe6onlDSVsZ7t3GXKjvBId7SLggBcZs8Bh3
         Am4WEHbfDvD0VN5uYTddOhb1BinmnMKQ++ksgwkQsJjy5f05kn9rx25MDzLE63qyXi4M
         AzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790192054; x=1790796854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UA6HnleFaKMNeHtZg5wP2wOLqxj3WJzI/h2c9pM/vFo=;
        b=aOjQ9yi+v7ot7XULcE6FpYMGqfSkxdxblxw4KcWl3YzqiWkYmXrYS9uH/MsC/6UN0L
         X9DSsx7Ki8MRKWe+YsDwmdJBJrTHdEv8g1y6k7nTWHgn2XEdv+YM6kQFQuHehxcX/RB8
         JA/LWz0ufzh0ELmGsoPULXn+oC1Whgs4EIhr/mFoSY3da+AeQAa/NroEWHb+ON9uV5Kp
         6ilfOAUirWDYdWwv4q/D9R2qqk/JRTC5fTu8cX4wNB9pOdul7PJALzeTXRJRybr1E9sm
         JIG9qe0UNfmzazDjrWhTkH7LCJEVI88HseNmnLq68+SD86CmDHPhv2iZw/s30iT/7p4n
         GO0g==
X-Forwarded-Encrypted: i=1; AKwUvBwKCXQYbvCe8+84nzUZu97aimEsAvZJA7kl7G0dcSzMVUXiSNngW5ZwrTFOHjaRrkg2DzBoNq/5Ebvtg6g=@vger.kernel.org
X-Gm-Message-State: AFuF++n6i533dUtsNWglVM84VsSh+uBlyLXX63F3BP/KJFMiEWZUSEu7
	7/AwcLzVAYYetBWdGHCOJgXwLj3aIPa5jr/zphh27BsJviT8OhToQv1n
X-Gm-Gg: AYBFou18d5kyhAIF5b6qhuHDYTaxhKhltjMCC8Nam7E5/OGCgrdgpIJDKn5l51k4Xey
	pBOPLax6XnTYtPlSawjexnrKVnYYNEOAwf+SmTrSi85Om0/gFTEoo0pNUlI6KQPSyynFfsQQT4+
	fM03lsVvDjOBK8pckzjBhpuPFsX/u1zeWj4YCrVofJJPdoAFxOe2CtnhHti63VoGRXIXOAjkb9I
	8TInqw2BPYF4v2jTtUGPRnbjRExvVZh4CpNwMNRIFhrymS5OXIUf9f7ELT0CGMSGeDTM9/mRTuS
	w8OrpyqEOZcQR2ZOlcA+91dfo1Iql+A85QiVbP8wdWgIY0eYevfapOn3wS1VZqXhXSTL/NklEI4
	c44JS+RfDNjJH5JajLJugKsHmhK16S2duk9boscoQJGkPq0foItRlyeCsQfhwuuWtGyIvhzP0FH
	Bxo6YO02/kjKFw9ZqLoV7vAjcxDXALwT+W/BCg3Hy2R1gfRLbNtpKBy2ZW9HSopU0=
X-Received: by 2002:a05:6102:3f87:b0:7a2:6b90:3d7b with SMTP id ada2fe7eead31-7af1c691fddmr271537137.8.1790192054343;
        Wed, 23 Sep 2026 12:34:14 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98527fd0592sm110188241.1.2026.09.23.12.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:34:13 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: andrew@lunn.ch
Cc: maxime.chevallier@bootlin.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: Re: [PATCH] net: stmmac: guard FCS stripping against runt frames
Date: Wed, 23 Sep 2026 16:33:54 -0300
Message-ID: <20260923193354.1537557-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <e0515b50-8a7a-4c4d-91da-9b62c2f663bc@lunn.ch>
References: <e0515b50-8a7a-4c4d-91da-9b62c2f663bc@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andrew,

You're right that the relevant question is not merely whether the MAC can
forward frames shorter than 64 bytes, but whether a descriptor with a
reported length smaller than ETH_FCS_LEN can reach this path.

I found a closer NXP/Freescale reference: the i.MX RT1170 ENET_QOS
documentation (IMXRT1170RM, Chapter 61), which describes the Synopsys
DWC EQoS receive descriptors used by this driver:

  https://www.nxp.com/webapp/Download?colCode=IMXRT1170RM

The MTL receive configuration explicitly supports forwarding error packets
and undersized good packets (FEP/FUP), and RDES3.PL is documented as
the number of bytes transferred to system memory, including CRC. I don't
see a documented lower bound on PL.

However, I also noticed that dwmac4_wrback_get_rx_status() returns
discard_frame when RDES3_ERROR_SUMMARY is set, including CRC and
receive errors. So an ordinary CRC-error runt would be discarded before
reaching the FCS subtraction.

I therefore don't claim the documentation alone proves that a good-status
descriptor with PL < 4 can occur. I'll verify whether such a descriptor
can actually be produced by the hardware before claiming that as the
trigger.

The length check may still be useful as defensive validation of the
hardware-supplied descriptor length, but that is a different justification
from the runt-frame scenario in the current changelog. Happy to respin
with that framing if you prefer.

Thanks,
Aldo
