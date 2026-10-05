Received: from mail-yx2-f39.google.com (mail-yx2-f39.google.com [74.125.224.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E496F20E023
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 17:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220539; cv=none; b=nXMUKxTN+MpgJdpjQKBzLXDOsNHnBZ3r23Pg6BTV5QlZZyQ1SXkwLSaRAxrYyFWkZDoagH9xRiQB3MIDOS7fM8oqFrm0Yr+O1T3clxMPUNip09Akd+xTkrsy4EUXFQN59XBuU+ueGU5nBKsgzhnEO+yPhz5lUSN59jGhoSaaIOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220539; c=relaxed/simple;
	bh=998FNxn0ZJwzCIzGEHQSyAioUYH2GLPFWbSOsSZUURw=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=F/VXYNXMMTdVUGRqrkqyVBj7raXKdNOALDRwPP/0QxySRhJwkqBccexLqWgKP/H5tNWQmQywcLKj+DQYLQWYJgkEi7jxBHi5vQerIAuE4krfWMLck/6EsXDODsfkrGMezUIrXB0rGGK/v8tQjEObfLiXM+DvkcpSlQ1Wqx21iTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZqJi8Jl; arc=none smtp.client-ip=74.125.224.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZqJi8Jl"
Received: by mail-yx2-f39.google.com with SMTP id 956f58d0204a3-6755aad8a98so1100977d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 10:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220537; x=1791825337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GiMc97/Iy0RVOFN6ykyk8XCmXGkN1FTr+5lXo5/eSk4=;
        b=XZqJi8Jlr0a5iFqv2jXPXVMwV8vSgpkSet4rAuGkz+CVq6X4ov8obxKAygbLlmB/Oz
         cFZAeMGStXX/hNR419JYeWkp+D1q9Hrp2gkhMemE8zRxoPRLIidqFzDG638jQxtfG5Zr
         rlmRNmtAQYaU7hfqRDPDhZjXmXgvATcdLedJKo3f0e7B+IbJWgt1rcF6bWh8vV91m3Kr
         bgAGUmXiUkcCRyqs2mB3t5Y7Qld6xhYanUL3DYBwHcKdHC1WYnENjLTLYLrz688cTwXc
         WRo+k/Lvfw1WzopUABk2rgzYx+rnKqXSvRjSFFvQ0ISw8/mEaux+BU41pZ4mRUk8HymF
         NQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220537; x=1791825337;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GiMc97/Iy0RVOFN6ykyk8XCmXGkN1FTr+5lXo5/eSk4=;
        b=R68om6oREQypoOyL2Ozru83bNtphfXDbgPdrCyXyeEJgCFOQZKHG/YzOzXXwQV/FFm
         AAnlrjlswnFwFxEJv/zm2xcAgsnmihlhpmeI2e+PEB5UFKT/Yk7UC1CYyUIKf5sdl9z1
         /fjEShN5lAOCLGeETTnZZhSOQZfx1kfyCBoOC/x03ZBCWOvgqQ9yjF6NtQF4ir41HmWF
         ZNrQIuzO4gB3L+YbWc4+oCN1JHsWY3m4P/WCYIn3KczoISvTCYf1DnJclxXqBFjCB+aq
         XD84AbyL7qapHZs+IsHe7B5qrb6B9E8bErJhp7UdCkz+8ILzY+TSE9vXd2bX5qwi0hiF
         RSNg==
X-Forwarded-Encrypted: i=1; AKwUvBzIDnVLqZ5jGdaEa1+XhoQg5Ng5TqqEi4GUc2ENpWaMg5dFLSVtgGGV4aLILg04pNOSWXEy42I7RuiB1Ys=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBvy9Ftb7YCOsgVWqpJTaRYs7eRbB2fX4c2j0ZRfyIHk2zxmgE
	n6UBZ64NEsRh4KIGWT2OSd8ON3v5VIFxHdATMp6lc7Dl/DIXXylNKfQZ
X-Gm-Gg: AYBFou0uOD2wzxiDwQDarhCQUSUliPzDt6+lKq+0PxixcgGLgA7r5IS/hkdk6g0fVcw
	hKw5CkwA5V1A/Dg0ADlXDraEjKFMWtugruF8dL0XEzMztoOZedDlHcsasgTU0D0inzy8bXAntoJ
	pvfP6Gb/Zskg8KgkRLQTbOBS3A1dnswnpN1tPpCH1qbe9WplrGsqQk22DVLpBIMH8bhI6YYhnTy
	HKZ5IKOnLrs/929TFvV8Kwrxz68UXaIrqu/0HNMWKiXoC+Xbrm1sKw6vdqBNAPgJjpzfKzz4iXv
	x6Zn1TUcVUqL8JrwjkEDLDEcSACuykOOUPo1F5wXPYEvnfF24++jRNeVe+Iccv3Qq1+GNw7ovqQ
	85ef3qITaAxUSu9RPI+6Jz8SYCrY+RnZ4/ik4Yk6EvNi3z/ayIZdfJz4K+gTqRqu4CQr4xH35iK
	itob6SvfH4uhbV8RRk33NBtueASMaLxR4yyK0hZg2yWG1+iad/uJHrVb3mjPvOJ9uaiLNNp0CZ9
	NOVnDa7FiNCcKxBtzhOrCnIn+edpAuL0tXhVDcZBCmEIdm/IMK3HUi2RXW/n0M=
X-Received: by 2002:a05:690e:e8a:b0:677:a816:4bbd with SMTP id 956f58d0204a3-677af52917cmr4014487d50.51.1791220536664;
        Mon, 05 Oct 2026 10:15:36 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677c1b1b585sm3432802d50.5.2026.10.05.10.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:15:35 -0700 (PDT)
Date: Mon, 05 Oct 2026 13:15:34 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Umang Pokhriyal <umangpokhriyall@gmail.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Jason Wang <jasowangio@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Message-ID: <willemdebruijn.kernel.2caa30c4a0ad5@gmail.com>
In-Reply-To: <20261005061236.22907-1-umangpokhriyall@gmail.com>
References: <willemdebruijn.kernel.3720fccc8b4e4@gmail.com>
 <20261005061236.22907-1-umangpokhriyall@gmail.com>
Subject: Re: [PATCH net-next v2] tap: report IFF_DETACH_QUEUE in TUNGETIFF
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Umang Pokhriyal wrote:
> Willem de Bruijn wrote:
> > I suppose we want tap to expose this state through TUNGETIFF, like tun,
> > because applications already use that?
> 
> Yes. CRIU reads IFF_DETACH_QUEUE from TUNGETIFF when it dumps a tun
> file, and Cloud Hypervisor did the same until it found that macvtap
> reports every queue as attached. Code written for tun's queue API gets
> the wrong answer on macvtap, even though macvtap accepts the same
> TUNSETQUEUE.
> 
> > Else cleaner than working around bits would be a whole new TUNGETQUEUE
> > call to match TUNSETQUEUE. Rather than to squish this into TUNGETIFF,
> > while that has no equivalent in TUNSETIFF.
> >
> > But, that approach does not help existing applications.
> 
> Right, those applications would have to be changed to use a new
> TUNGETQUEUE.
> 
> Thanks for taking another look.

Thanks for verifying.

Reviewed-by: Willem de Bruijn <willemb@google.com>

