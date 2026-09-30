Received: from mail-pj2-f37.google.com (mail-pj2-f37.google.com [74.125.227.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B55451996
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790798497; cv=none; b=Pv2Fe06c6bABFv9bWegs/oEtqBxUkD0ak3gtxeBtyo0kbKoghzuPZugiQ7VZ8qjovrv5zI+GbdshxTPoCwK3BnPd6VwvaWXdoUTmTDZdVQ+koFUGty42wTYKmTt4ErrWz+7bxL8yRKHoJOWaoMQSasewhzJFy/ELdQ9KAa8VKfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790798497; c=relaxed/simple;
	bh=dfmbAABZOBNzKBzZGaNTByGahqCTy+OziV7PoeK5W7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PthxKA9iLmncalXcO/mJg0XqOewVOwl5eW55UWnGmWl3cLw4wiL7zNzDHXlMCkeXZptJp5Fu2jr2Qc2ifiQHtGsQA6QYv3lMMMrgHk7OAXKw88Jcg2mJjHiGz2K+ie+6/asDn71UYshnYIk5HQ5ez/Sl3CQv7PO4VkWf4M3jSyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=roM/2cnu; arc=none smtp.client-ip=74.125.227.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="roM/2cnu"
Received: by mail-pj2-f37.google.com with SMTP id d9443c01a7336-2e300fa47a5so928655ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790798496; x=1791403296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dfmbAABZOBNzKBzZGaNTByGahqCTy+OziV7PoeK5W7U=;
        b=roM/2cnuFHR5Uf1Vyvw0wOILfZBHiEdnnXsPue2z1iB6sYX5TpLNDHFpto7sqhfbN8
         OwidsSiqlVvOD0s2ZxOllbmTLUp3zYMg8r9r/baMFr7skJZJz6rDLP38v2dCqT9n+aHo
         hqtxYvAIgLe0j9ISl0K4VTa1swtKTgXPsolW8NI9DkUCCY3fqcDvk5MxJ5PtRGw/SgUI
         TQmPQD94cH+kD7kdyewHLZgeMG0nhS9TQ12ZgIkyMjHr+4TyOzHm0pY0srBCU55+Euob
         AAf6La0h0xnfE82QDA48x5/x8DygVIW3RZOpgbA9lfrGZ4Mn8/lJxAVnB3+NKonNmXRL
         1myA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790798496; x=1791403296;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dfmbAABZOBNzKBzZGaNTByGahqCTy+OziV7PoeK5W7U=;
        b=pId6kbRCorY2et05VY5DVIED8uekME0cLV7rNkWFyYR/Tmm3WmNdYDapLTc0Dh4meu
         tOWQ7puHrBdu80EyXOjufFG3I4lswzchqi8gBRegNpOPUN7ywleSdsgGVCQxBmIDvRCJ
         qbUi3yYKRpWxDPrcf5/1APudqumx+KCxftZRAaMZAwnwcaAU3S/puYGcipOvjkItuLx5
         v2ighBiuKmL9cZ3t1D/nS+bQnK4ieuhfRR45wNUxLQ1sesAN9JCrgUKmoXgmiLS+4psz
         rEM11F0PWDdVsQWaIGqxdF1LDYhKl3CX9/ssMkzA4cCZXCP3KHTKgeeRB13og8JXjVwq
         b1ew==
X-Forwarded-Encrypted: i=1; AKwUvBxSgmQRYTJdiCH5IYhIkvQAqMyJrEN1WQQeHwGihyjEEwa73coT2+xwoK/S9QZOfTQoEJIIXC9j/iwHHVY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7AcIqwdF10igBKrEvIKnQF2/g61yu3Co6q2ZH9GCJQ5q39U5m
	t57VcHdu6uRR0YupWGFJ7mUGWtXUuvy5io8V4cbphm+89hAgPqdJZI56yXgJN4U3gF8=
X-Gm-Gg: AYBFou2BrnJoLpHH4DrNHxdlUdBgTUgqfjhNu3yF2UVFC2F/2RgykhCmSCQorTuRPbq
	HdcFxxT6xWTRFDKUMAn9VGJaw3DFsiHok8WInmuPj0C/j+KgplVcoL9z8pbgNVzIZyj1E6HaF0E
	2TJZHukvgzrXzAiyQQGDrNYtXTEP5Iy2mNqTsaszGtABOU7nRk0f+qbxbjiWn2vzA6gppG0kYeE
	QtI5xYv3jCy6Grrjf8KApVDIdA3iC9GG2hkO2qDy13tM2sb6NW+qqUgbHRVA2C90YK15VllY42K
	UW6VKmI9JSPuGJRaL+hnFWLKPSlWUp2L+B3lAx63dK+FQR7cEKBvRe2P0/DMeQOWSpu0K1Ug0gO
	ofT4ybREoZQkAnJVHUQhOuLlxq1ImKczgVLAIu8Kf+UYWhWZZTJkMhSFWPFMNUM5mUpzSsfd3J+
	EzCLOoB0/HDcRebKLiUz0rOgT1Gom14XAhlYlvTvQUqMOdzgjT94iAhNOBeHGHDUfFKKv48beMG
	TUWEyi/fMwuHa0m+WgUb1c=
X-Received: by 2002:a17:902:f78e:b0:2dd:ad74:ac2c with SMTP id d9443c01a7336-2e2e4a24efemr20316165ad.30.1790798495635;
        Wed, 30 Sep 2026 13:01:35 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:70::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300b6f9d3sm1812355ad.75.2026.09.30.13.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 13:01:34 -0700 (PDT)
Date: Wed, 30 Sep 2026 13:01:33 -0700
From: Joe Damato <joe@dama.to>
To: Zhang Yunfei <zhangyunfei1@kylinos.cn>
Cc: netdev@vger.kernel.org, jiawenwu@trustnetic.com,
	mengyuanlou@net-swift.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, aleksandr.loktionov@intel.com,
	u.kleine-koenig@baylibre.com, weirongguang@kylinos.cn,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	leitao@debian.org
Subject: Re: [PATCH net v3 0/2] net: ngbe: fix error handling in resume and
 open paths
Message-ID: <ar1qnabXsHMZQBVk@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Zhang Yunfei <zhangyunfei1@kylinos.cn>, netdev@vger.kernel.org,
	jiawenwu@trustnetic.com, mengyuanlou@net-swift.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, aleksandr.loktionov@intel.com,
	u.kleine-koenig@baylibre.com, weirongguang@kylinos.cn,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	leitao@debian.org
References: <20260930094748.1198085-1-zhangyunfei1@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930094748.1198085-1-zhangyunfei1@kylinos.cn>

On Wed, Sep 30, 2026 at 05:47:46PM +0800, Zhang Yunfei wrote:
> Two error-handling fixes for the ngbe PM/open paths.

[...]

whole series feels very AI-y but from my reading of the proposed patches they
seem reasonable, hence my tags.

idk if these failure modes are real enough to be fixes or not though.
