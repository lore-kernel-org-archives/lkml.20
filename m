Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C306B517BBB
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571267; cv=none; b=JK6l38NuCWZLJGSzmqhB2OqDP3k+d8SVhJxUxNlsSrZY8WKeMic2mUp02j0zDazULiMgA/MEkFCK2Mro/1Nzw/7Tfn4759rRkLePhD9Zj+6k8BHlD3L4EXCKffYMjOCzIyW6WohUjMxn+VF4QPnQ1OLV4ueXZEuTe3oJ1U0JE5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571267; c=relaxed/simple;
	bh=YANs3wQmiPKZOnM/NXs3Y3IF1HigPG6bBSIqF0sVvSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HPy8HHI7cpk8sxx20fMOGE1/G1ysi4t/TbDpTjek+8GxPUBkkS8dZMiq3MKok3cA9ZGQBuW4IfPcPGJo+XtC5OxI5QMXjORspfHOyKZk3f5DTr2I4fBPdguFNWJGuBbhYuMXgzBpAKeClb17OnbYUWVyWia+nuZL07l+FZL4RHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=tKYwrXRU; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="tKYwrXRU"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso4670121a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791571263; x=1792176063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+zSZLoNmFFWIsOAx+hwoTbAwrWW/U2t6L9bJl8Gumbo=;
        b=tKYwrXRUNjDwLCc2KeLPnUN3iPUJJ4qSmDlQBFEV0rZy0WWg+yGQODgYWTAcF68xP6
         rZkl1eZvu8hlM/470nwuz9dJjnUvzSQY2OTwQd8vl+oYbPbqWTsO9DrR1scz2zSkDIWD
         pMjR0mBc4sYSUoBpvjmrR9ahH8k8sZzh74dEgyB49FDxf18pPUvUcyv/bsNjkJAOGjct
         5aQ8lwRSCkehS3G38z8T9BE4JaBAsLp1r/1PwI5+aA/ScG+0HauC7Nf0gssT+dqTSqpD
         OqFNDXhENWX/jpqEZ3Ac5Z83RbipOJL7Xjm3nRTS4Pdpk1gcum0EDOL5uJHQH6uuojhp
         buNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791571263; x=1792176063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+zSZLoNmFFWIsOAx+hwoTbAwrWW/U2t6L9bJl8Gumbo=;
        b=LND1k8/kV0c9W8Rs0AkOkGCsInLQsfyRWtmpz/wVgLddYZVLPoaDeIqCvc1NkCxML0
         ckP6Y4xSLcYSpUL+YE8RwFDdq7iZPnC+FjVmJc/C16IeF/Gq+xMlBP0arcxaNGSDF0SD
         c2LX/NBycd6F3LdWfhetov7VnXMUvyp60rUWUNieomWt42zenOcuITfMPb32jDok0A6D
         QqKN8j61RVBxSIu1uh4Bh3JtE70SWlW4qJY0pAAkksfPgDb+zUFg8qVzbddaBErzfZ7Y
         HUquMmtm+S4VGQTlegPoKoE4CS8Mablchj8ZeMFO8nSok0j8tpm9p6Irh+oQFS4tUUQp
         KR3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwWM3ao1+UZdsGDhDonrwzkV0atUxQFiynr1WEYNMQg+z7M7lnymY8slGu1to9PdyH40bqT7MpAFZPbu1I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyJvr3qDdh5dT7HbhiUqigDs0AwFh3eilskTBLhd4saddBChsT
	pn23cvPHgbUTAV+RH0ls7WfDdYYWya6OEuIzE54jrrhOSVAyE3trzz6yQeuObw2Qglk=
X-Gm-Gg: AYBFou0ICvL18eI4XqusoT4ErDo3JOO6eBwAYRaVBF4JLeR/NZclvTmttzXUfxfa5ZS
	JDUm+yKytqeYebdi+LPLrTimSsxLJ+fiqGJ4OSCVoushtIxHo8BGg6hF6j/gOnyqIMFfbvCJp6X
	LsInarlWf0fbKbAtUwvkjbmaVqs3SvOOl9VtOAJQXmWKKthlYJgzvzy8cs+TR9WX11cmg2+k7GO
	riSnW/sV2o9vpeNa6dBCWvgkwh9kYkGyOi8SUtjlTJEhscn4wbQGmaCNJKojrTu+J1RFbzc3kLR
	pMAa7HkiqFve60YpB7XQbW4KA1Y7Cran7vm4gXf9pDETyW12Ygs/9Q22iPrHp3Nurg4i/DhPZfs
	aP6pygq5/f7EydiuC4PA+9aNWCfgERXpwpmu7WpprjswBv3NqdNYXhtwPDaRNgBu78nZaBLJnD5
	CJ9LXyhgUGRc+X6Cw4Fb1IjLErVikcG/EJCqGwmo5KtCMN6bcNEAjW8+j4s206WlAdR+PZQnSZ1
	Ga6YU/LhjVDhR1MoT3/wg==
X-Received: by 2002:a17:90b:1dd1:b0:3a8:bb56:f1ed with SMTP id 98e67ed59e1d1-3ab3acf313fmr2482096a91.50.1791571262758;
        Fri, 09 Oct 2026 11:41:02 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:c95f:28ac:324a:cdc3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e08c89sm1485211a12.8.2026.10.09.11.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:41:02 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Daniel Zahka <daniel.zahka@gmail.com>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org
Cc: kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	daskald@meta.com,
	mohsin.bashr@gmail.com,
	bobbyeshleman@meta.com,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Subject: Re: [PATCH net] eth: fbnic: validate the Rx completion buffer index
Date: Sat, 10 Oct 2026 03:40:41 +0900
Message-ID: <20261009184041.1604456-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DM0IFYXERNG1.2ZNS2EYUGGPOF@gmail.com>
References: <20261009175358.1598001-1-yhlee@isslab.korea.ac.kr> <DM0IFYXERNG1.2ZNS2EYUGGPOF@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri Oct 9, 2026 at 2:14 PM EDT, Daniel Zahka wrote:
> How exactly are you injecting the completion? Just overwriting the id
> field in the Rx completion with an arbitrary value from the driver?

Yes.  No emulated fbnic, so this isn't from real hardware: on a KASAN
build I ran the completion handlers with FBNIC_RCD_AL_BUFF_PAGE_MASK set
out of range and saw the out-of-bounds access, which the patch removes.
Found by reading the code, not from a report.

> The buffer id is chosen by SW when the BD is submitted to the device,
> and the device just echoes it back like a cookie when that buffer is
> used.

Agreed, a conforming device stays in range: fbnic_bd_prep() puts the
ring slot i, already masked to size_mask in fbnic_fill_bdq(), into
FBNIC_BD_PAGE_ID_MASK, and rx_buf[i] is that slot, so every id the
driver hands out is in range by construction.

The completion path is the one place that takes the id back and uses it
as the rx_buf[] subscript without bounding it.  A device that returns an
id it was never given then gets an out-of-bounds pagecnt_bias decrement
and an out-of-bounds netmem dereference: a device-triggered memory
safety bug, just not one a conforming device reaches.  The patch bounds
the index and drops the frame for one comparison per completion.
