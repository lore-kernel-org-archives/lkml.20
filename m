Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E605743711B
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 13:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791121487; cv=none; b=ntG+oY/4JoYUOjmOSwTUmVySBmAzDQ/ptgnHa6tOvBn2P6VoSZl7UhVswn1eKjQ0UnKqCwtmE5hPa1L5MO6H7kmGl1fgRdjJLZpDpwCBjr5pFuD8p3NBwqr9aglxQsFl9VwqknoU48Ss9/e6m/6rBvpAeojKMxu+r5q0vTLjuFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791121487; c=relaxed/simple;
	bh=ln9flUKLuXflNGj9stfywtJ7V/181gsJo/hWYooAygk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ovWxtgANRFfy9reWrfCACpOEHPh/ON8aq0SftBd202D7fHIOuco4yVKael5LCcylhgSrd8q4yXaH9oPzHHOV2a4A+kqrLHAAcUrkdbxq1On0KGld04ywd8b4aS761ZMZNyugKdVpUSBYvO+W1pRNYsu5x3RmuZ3mUrf0pfNxHTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=lpo0j7u5; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="lpo0j7u5"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887840c529so257747f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 06:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1791121482; x=1791726282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/AXmPQS6GE1nJ+OCjL7tvM9iqkO2JwhEp916Dgp8F+U=;
        b=lpo0j7u5tz2Xws2oCbBcox/1SvvG2cFO6KU95lzIWD5KnfaKercolp1DYFj7NjzUwZ
         ToFZLrZvHF7lvjbFYGMO9DBA4P8ACqd69wy6RkeaKQiCWq11v6L+r8WnQ1SNv59IGsPy
         LFZ5WBOCwB9aWXco/k5t6pPz26SmYaxQYEBDyILOb97MdTKNIi7vqrMdEb16sv9ILzmF
         N0m6EZYbnsuZ8ZP+4By6typog1L47eK61M+aezVDhlt7Zpi8cGDOBiApPOhtqw8Gcrge
         IIuuzPiPtefhKj805DUVyY9oW5/7ojfBIYgdtmnDIW5W8hxHJkRIpTIHvqd7fSz5TJ55
         UMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791121482; x=1791726282;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/AXmPQS6GE1nJ+OCjL7tvM9iqkO2JwhEp916Dgp8F+U=;
        b=XXf7FaVuwsJZB6NTJ7UbScFu/dJJbxAbQl7GWYw+Gh+bn8NS0PHxZ+Lq1hPmHo53hf
         Q5CrtaIEdiPeGf9tpD/LkERpkP8xJwoPzXME5+kSic0w3OgvnxmDV1YB3MKwBJf3G3br
         0Q4xU+L+44YoXe+jXS1zHZcxaPbHSCfC0xVeGJBGQDWPaKqAo7tbFNT2p1n7dGuepuzj
         b/u5iGfDjwZ688W9RoYd2moazF0F4pxcLqOocAMe74ZVRtDCrWEvlOGmhVPwEwBF75dr
         03eYg1E4+o2vwaMMH9jx1s6/CG38hROWgpWuzcgPz5en44F67Izo0Heayf7neQ5O+Xb0
         flgg==
X-Forwarded-Encrypted: i=1; AKwUvBw9aHvGU/xLilCupw4wXkY+9wi4y7fqeK7O+qfYL6rMQKgyGm0sidaQhJKPg0X3KS9ciU9PqXvRmDiBh28=@vger.kernel.org
X-Gm-Message-State: AFuF++mPUBDQ4Spuz8iafI/W2YlRwzp/2pbjTzmsNAwvzD8XawkTVwMa
	KNDbpvS6dSbuIRE6OZyqQa/oFJVnjHCxbHO7SixP4VWyVL8f7fChJPgxITe8koNGuK4=
X-Gm-Gg: AYBFou2Z7SKV5SGGKpvwC3WfpFRjZtGMSajTyNJbHY+ppyLezKhvE8AN9IoUeo3ZDaC
	0PpIhK3tFCHzKrvLSr3tmz+AqOUEwHYx7YRoZ6149ytUV9KdGrce2H5spzfk6ibhi1eqnKrmAGh
	Apw11SgGQQfV/PzCvini/8RVGxaqzCB4cV/eyrjJ5IncHX0e8gtmSDiPUWue0N+Alq3oGu3SmUe
	DANMkIUP9Zow8D1QXms6o11fGHjqkAK52TFECF+tif9SoUh9Ib3jYr00zzSdh/O145FSPYJvcmD
	9ZWvLcq8ZZn1RtnDnqYaDoMUXPnwTWJCGciRjXIRUptZKeijB07z3a9dEq1+7veVmxs93xHkYio
	L0cUNcRr9mYJPb4MsCCBgSPduQfnuOVNHqeKLqu2+JqtAEFWPpGt69mPVDeYSl7eR7pJRNqiwKu
	Qc+2qL7Y+Dw6+RdiHKu1xcqN+3TW7rnJiUPlhuVgfHeA1l0AECfklHLCy/hzFG4LlUcGY1yNefI
	5+8V6V5ZQmp2D+L3USW76skDUdl
X-Received: by 2002:a05:600c:530e:b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-4a027534c46mr151316115e9.6.1791121481987;
        Sun, 04 Oct 2026 06:44:41 -0700 (PDT)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280be5dfsm287188975e9.7.2026.10.04.06.44.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 06:44:41 -0700 (PDT)
Message-ID: <01600be7-3d8b-48b2-a59a-1125eb452714@blackwall.org>
Date: Sun, 4 Oct 2026 16:44:39 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: bridge: fdb: hold hash_lock when an entry roams
Content-Language: en-US, bg
To: Julius Bairaktaris <julius@bairaktaris.de>, netdev@vger.kernel.org,
 bridge@lists.linux.dev
Cc: Ido Schimmel <idosch@nvidia.com>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, linux-kernel@vger.kernel.org
References: <20261004124254.3525496-1-julius@bairaktaris.de>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20261004124254.3525496-1-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/10/2026 15:42, Julius Bairaktaris wrote:
> br_fdb_update() lets an entry roam to a new port without holding
> hash_lock. It notifies switchdev that the entry left the old port,
> writes the new port, then notifies the addition. When two CPUs receive
> the same source address on different ports, these steps interleave: a
> driver sees two deletions for one addition, or an addition for the port
> the other CPU wrote.
> 
> DSA counts references to a host address on the CPU port. The extra
> deletion fails and the extra addition is never released:
> 
>    qca-ppe 3a000000.ppe: port 5 failed to delete 02:5a:0b:a2:1a:46 vid 0 from fdb: -2
> 
> With one address roaming between a DSA user port and a Wi-Fi AP port of
> the same bridge, the error appears 3-6 times per address when the two
> ports receive on different CPUs, and not at all when they share one CPU
> (4 runs each). With this change it does not appear (6 runs, different
> CPUs).
> 
> Take hash_lock when the entry roams or its flags change, and send both
> notifications under it. The common case, where the entry neither roams
> nor changes, stays lockless.
> 
> Fixes: 90dc8fd36078 ("net: bridge: notify switchdev of disappearance of old FDB entry upon migration")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> ---
> 
> Notes:
>      net-next 941056f91907 ("net: bridge: fdb: factor out existing entry updates")
>      moves this code into __fdb_update(); the same change applies there.
> 
>   net/bridge/br_fdb.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
> 

Absolutely not, this was made intentionally. Taking the hash_lock would further kill learning
and roaming scaling. Surely switchdev drivers must have dealt with this for some time
now, if you'd like to fix it do it so the software path isn't affected.

Cheers,
  Nik



