Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9892C2F8E90
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 03:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789270358; cv=none; b=jCt00HfBImrUQAbxdOK9Eg+vr885hpy+DhkZYC5UHXreBHbmBP8bZSKlBc6/ORn5jYa/n+sRvc2fLriUKE2cWsurkszjfQuC1Bz8OPrkxUnPrrcHXxijmlm+FAOZ0UbdYBJrj5MO4OSxO/+4XkVnI9ZVYbwDsbZeZ2EFq49nrn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789270358; c=relaxed/simple;
	bh=qynwl3yegS3zN7wkeohcoAEZv4LlKGQdHuntDJ7koXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r99he832gbXlN3L/lSVRn9oYk6xdNHxf2BJ20W/ntkESHiACLkMNo+9HaS2f+B67IvfgYmj98k01lseQWsyMveJd1LKG4sNNBhqGzZ7ncP4OeghrA4upc1rtqg+VjEIVRt+q7Q8i6VeUykj/Mk+pvM2zBYdSWZLjfBQq6U30y4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+xqe64m; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+xqe64m"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a49a10ee5aso5788931fa.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789270354; x=1789875154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjaL8mti/vahJlLkdMnZQO8Ei/dHHViRxDz/+EAVwR4=;
        b=K+xqe64mRgpbpxbwP50a8Gjn9ttToXXtZlpjd0dHUzX4hfIf/lDYCkhhnDVPXq+KFz
         7o2+pmeKCd6hsbS6GHLrWGhySFNxYgHXhSnTV9gCb9VuOx8dJRt3kjBzxZ6hoZrhPZMB
         OYNsqyK6F0BuX9KM4MXBJwwWCW1/i30zypBbJ4QHrvg8yhrrEGZPF7LrhFMuAzAr0sAK
         1H/WPP6HZYHQa2lchsZB/laJsrthtdbJT7hu6AbhkNiLbHWFsk8e2D9vAh3x2Nv3qsKR
         zkS5AnByw75wLEg4xhoZ6b3VFRowNutb6Ws6/gTFXgLvoS8TjyXskItoEAi5XlCRhVnm
         bUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789270354; x=1789875154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjaL8mti/vahJlLkdMnZQO8Ei/dHHViRxDz/+EAVwR4=;
        b=ZSmIGYa7k2qpC2vNoRPAFyZlvbkfGaQsnINQPwlKP6lOTTBnr9GeFdJBn8DDjouBHV
         a31IFSa2T+z1rQc3VD73+4RkkeVehlLT2gkr4DuSOGyRgdgxv8PYWmTHxZzlVbowufvT
         wpgCSL0Se3VMLOxa32PxUFSer3D8C8403BS35juJPKyDmbYkNMATBLeXcVde7qLurmvJ
         5tBI2IpRU/F5Cs+0zdb9k4AQlDQrJcXolAjCFd4eb4zDVVtXvqtW1/U/zO5uDB/A2O82
         NVNp6gXAYP1ZFVF+9O3AzUFxZmSuM3k+NcGlmUFP40oykytMwfm1KpDgR055jQkWbFVK
         dHLg==
X-Forwarded-Encrypted: i=1; AKwUvBznnrvCrPOhWO0U/gDD95wTPEi5eXOkQZjTRuzYJiHpj7/+ebMbJnZ17T+sObyaFN3Lu92Ud2Vzx3xcKH4=@vger.kernel.org
X-Gm-Message-State: AFuF++mDns+4zZcUMYUlE6rzF46emnhHhTctTcAU3hEQqaCSuCoapQdZ
	Z+xVcuYLQtH0voaGKQ4BcKjhGqsbRsRrRt4sVlaRy7BgyZ/tkPxfEY+IBAg1sFN588I=
X-Gm-Gg: AYBFou2C64zpXGuben9+UrSxoIcL7ftn7AHasFwxxx821zAVwFzXFHUAw82+PxqDcky
	p6nmEGrrOA6NbG4V+HFJHeccjF1j+mKIGwd+WihYo/nCxxSnmbIzL9qXOVESNwYo+ta+SRdQSSz
	r2FWAMmcrUncNd1F2Aht+xkKSXzXxlIdZIAg0FqfuXOYpv6134mxKOyqNkL4mqzGzlO1ZVWMH8p
	BWPGC0sc0iUxcMSqU0hjnci+toEz6Z4OnH3L7biz5CTOd7JJgrbfYTSinLZs4vIT6SUBb2VkK+s
	vaa+ABVyC0t1iUx5Y47tCfErCCUPhiN5s3XY/ZuS1flKvpE8z9ZuW30KfsiJ76mu8AblRKC/Hqy
	ieklQOAe/ZWOx2kOaaWRVWE+7w8J2ZyjoK1gMRl4P0CuP5spolLUkupVtTUvRKCW2WH7CXHkFNA
	ToJsqLVgLbzMl5bf+UqC6AvK2ksfJM+NYA097+JxkKkh2qz/tdB/C6dnmMRUZrCWmccuMkYEzzV
	npOzk9vc5vM6IXI/Ya3xe4FDNKC6EGz5EtKveOnt6tE
X-Received: by 2002:a05:651c:144c:b0:3a5:ba1e:8b05 with SMTP id 38308e7fff4ca-3a5ba1e8dfamr2827451fa.1.1789270354310;
        Sat, 12 Sep 2026 20:32:34 -0700 (PDT)
Received: from dau-home-pc.. ([95.139.134.117])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a33a1cd1sm17024041fa.42.2026.09.12.20.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 20:32:33 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 03/11] selftests: net: add a test for the tunnel RX drop reasons
Date: Sun, 13 Sep 2026 06:31:51 +0300
Message-ID: <20260913033213.873609-1-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260902184549.63f37d04@kernel.org>
References: <20260831215137.549324-1-littlesmilingcloud@gmail.com> <20260831215137.549324-4-littlesmilingcloud@gmail.com> <20260902184549.63f37d04@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 2 Sep 2026 18:45:49 -0700 Jakub Kicinski wrote:
> Completely unclear to me what the value of the tests you're adding is.
> Please look judiciously at the generated code

Dropped all three selftest patches in v2.

What they did: bring up two namespaces joined by veth, build a tunnel
pair that disagrees in one specific way, send traffic and read the
reason back from the skb:kfree_skb tracepoint.  It is how I check that
each path I convert reports what its commit message claims, and it is
what caught six paths in an earlier revision of this series that still
freed the skb with SKB_NOT_DROPPED_YET.  That value is in writing the
series, though, and does not by itself justify 346 lines in
selftests/net.

If such a test is wanted at all, I would rather come back to it
separately, once the conversion has landed, and in a smaller form:

 - perf record -e skb:kfree_skb and perf script, the way
   openvswitch.sh already does it, instead of driving a trace instance
   by hand;
 - only the cases that are not evident from reading the code: a peer
   that reboots and restarts its sequence number, two ends configured
   with different options, plus a control case where nothing is
   dropped;
 - every case tied to the function the drop has to come from, so that
   the same reason reported by unrelated code cannot make it pass.

Is that worth having, or do you consider drop reason coverage out of
scope for selftests/net?
