Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660585;
	b=H/itnC42mjfrG46OpprjSfBt5CCNns5Mwao+V1Ywpl0x2s6J6m/1fGeDbxN6tgApyAX/
	 yGbXWo6SyI6pNUuvncJ3hLn4ZhiNOMwM6PBOMp70VLwGXI0F6M4N1r9UGxdPQEJVEZ04H
	 WBxxLi61Ne4ufOg/AVt1uvKobZQ94h87eIp+2nnxEarQJy9HMaQpWb1bSN/UZKM/9XIRR
	 RuukPyocT5gqOyUa5DH44D0XqKncuVNoMOiUdk0gqhRhmzpoyGKnHvItbZzMqlIt5SkVQ
	 exLuXK+Xiv63K1ysh8otiABw9LniVAKiE2l1SZnlVsXCq6gXUfZ8wpyDmXzOIbYkD6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=s3Hbpdq8bJvy97QquSYSmiPRVKUjmKCEWWHbHnrtGGY=;
	b=KmAZcJhyNk5TAayrN/ma47yO+K4kVAuilbhwVnSaRCILefoqBNQfnATfPhkhIv/IjAQC
	 D9a+HNyV++JQ2RaRhPK4d5h3ZR0gKfTwDM3Wo/+v6iUwkU2QnI8dYWBdbysEmFnOTkSHY
	 yjLgSN5XO+1KeeU333xJ4nOjUTnDXlnv7sk+k/ExO0eENLw3/Aqu15DwD+7fOd5WXMt1M
	 XJmgGJmOPjkHQpwK34c6DMQ/VgwUC07Ij2iB7a5bG3h8+wSS7ArmTOEv09q0re600lGHN
	 UkIf206JfLl7nYI6aLSYqye02eiprRQF0mK+mNMuyBgJn0OcPI69Q/MwLtvRRrckp0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AAEn501j;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A12D606A321
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A12D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AAEn501j
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-181516de561so326271c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792660585; x=1793265385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3Hbpdq8bJvy97QquSYSmiPRVKUjmKCEWWHbHnrtGGY=;
        b=AAEn501jZOYxOn/VI6FYdNPLrY/oYI3of9nt0mbAfy8oGc1FK7wwLz6x3PxpReHu3E
         640YXtHra1T7Lgmx6IAcbSLbz/ki7fQWyAtsynbF2L/0oq+aGxr+fm4JLA6hr1r9q5IH
         FCHzenYHAV/5s3NAsmh+fNPOFh1uvA0oU3fbv+1X8B0am2fqSpjye5mbpz/YGLE0q0Ei
         lOJJvwJTaNsFgkG9wKedi9AUu291lV/GH3+YKbL3yu9cB/4DjGsMcyU/8VD02vRT4WDb
         PFpgcdkZuy/RKbbT1TcPutonfq/0LuhFsaXvzrPuIlIgmEG/HCwiHiniwVFWpYtnRcn2
         6tlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660585; x=1793265385;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s3Hbpdq8bJvy97QquSYSmiPRVKUjmKCEWWHbHnrtGGY=;
        b=L6FP1LYi20brJaVWuH7ocE6x9bZU62NBELZwLdWk4g4R/pq9qfOrNt71GLNGd2AK85
         hJpvYEdnFkmVT/GchXuoUArGLPUN1+Stiw51mS0WJmaoqsr49Wkrz6WwLL7nCJWGlCWb
         PguihrR37Tjt5rt8Ixio8GCIJvQCpCl1b4LBMoYrnmsosw7JLovi8J7BcBNjQ4IwQAXu
         pO0H6k1hx7zIysVJZgzbwA8YnwWapDmuHJHGO9QCSLTZL8cOoyveFjjcV2Bt4tEUuVn5
         IPevN+RwDR3pS2BeBj7WJTuWHZzjZBFWH/xppo+u0qQn5ML7x7NhhR91EKUEOaPSLkvW
         JZvg==
X-Forwarded-Encrypted: i=1; AKwUvBx96TY06BxuYh5ndrn4HsYmK0iEkQC+wQQbwWkG7KH6BQPQMnn/qrpKwMOGLHzcpk3V9IBeU4SD7Vl5va4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiVZEuPEXVRB0xS6zEInVOvykXNE3K1uflwy+azJJURL8ktJdW
	Zr82uSmaw9ypuliCa+32YJmtRpFhKubNTbzV9aXkeLzuegBHrddflfA+
X-Gm-Gg: AYBFou3L5unLOlCBWvTJm15c1ChvRaQjBMe+yNQVQMP0ThGLgJrx398HvCUNUCBy5yL
	KCQYbLpN0OMU33/GBj5CV8RWD+PpGyfWYjAtOZRgqulLHcyTSXzY2QjpzrjHcbS7OUTQsYu15Tm
	RUyd1r15KqiltK5UpRym0EPHKh2vtC2cp1k4Q4Emxp18VF25NaVJ9M9/otzsbjlIgq6BvmwFRqt
	QLj2kz01THKPZHsHUzfo7OAQJSXYLHSIH5dCb4/e71abY/BFrEGxKwpSQTrTf9ACYS3njo0Gacb
	8tgDJgb48l1PRb+bM4aKFMSe1TYvPCcXi933Rqvt5VJvUXgrXAd2E13dC33vDRlgVy5orDym3jY
	6SbniJQA9YjkcyrBL5l0it1bQjO6dZkQSBF4XbyZ1GCvsYRm8vekyFnsK8MF8Mz0HVxZgxUYqhE
	+/L06uGE9iDct9jsSxmnEwMX4Bi6C6q3ZrE3dA1tQrKXwBVxEhuOSN1Uarr4ynN9KbzPlz8tlNv
	6tvNddBBgMgoIDPN2s23AMBpi9p/oY1ddh4MdiejrKyO+DFotvwYxL+aKmKh9vxcPEW462LGBpO
	WOGP1wtyB8iSSsHRNOk=
X-Received: by 2002:a05:7022:127:b0:14a:6a66:f6e3 with SMTP id a92af1059eb24-192f4fb0ed2mr3798839c88.20.1792660584630;
        Thu, 22 Oct 2026 02:16:24 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903ca044d4sm14095227c88.17.2026.10.22.02.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:16:24 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	bridge@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] net: bridge: VLAN operations emit wrong link event types
Date: Thu, 22 Oct 2026 02:16:18 -0700
Message-Id: <20261022091618.3651826-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

br_vlan_rtm_process_one() reuses the VLAN operation command map for
the RTNLGRP_LINK notification type.  A successful RTM_NEWVLAN therefore
multicasts RTM_SETLINK, while RTM_DELVLAN multicasts RTM_DELLINK even
though the target netdevice still exists.  br_fill_ifinfo() also omits
IFLA_PROTINFO unless the event is RTM_NEWLINK.

Observed on Linux v7.3, commit
08ab31164c55f20c7a2653de3186ae333470e2c1:

  RTM_NEWVLAN -> ACK 0
  link notification nlmsg_type=19 (RTM_SETLINK)
  IFLA_PROTINFO absent

  RTM_DELVLAN -> ACK 0
  link notification nlmsg_type=17 (RTM_DELLINK)
  IFLA_PROTINFO absent

  target port still exists after the DELVLAN

The kernel's dynamic-debug output independently confirmed
br_fill_ifinfo event 19 and event 17 for the port.

The request handlers need RTM_SETLINK/RTM_DELLINK operation semantics,
but successful VLAN changes should emit RTM_NEWLINK, matching the older
br_setlink()/br_dellink() notification paths.  The 2015 notification
compatibility fix established that ABI, and the later RTM VLAN path
regressed it.

I found no matching upstream fix or CVE.

The self-contained PoC and full serial log are available on request.

This was found with a multi-agent workflow; both event
types were reproduced in QEMU.

Thanks,
Cheng Yongkang
