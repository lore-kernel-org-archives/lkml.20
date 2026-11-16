Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794790739;
	b=xqX9D9HprQmAm39pQ+/gHnmavIh0ngwBL3grYF/PBpdWRFCZMX65kdZwSZ9mEYXNDZ0H
	 3uyAcJ57oKPyEbRA+ArQ5xvgflne0tw0fiAYRqm8ASPjGrIyeLTAu5vkPhQvXrZcNnAkU
	 K4W4JkvWnjcCiKPJbw6fBodQZjh68RrZBJQ9gHboQ4ZhKmIaKp2w56WRm+aIFw8zzDda7
	 vP17tRL2BfA3YHhWZ6zvYS3CDk1Cpa6bpTz7js+cRAxqmRKKAdxq7ETJbAnDHy4dwgSHb
	 R722N5zfIHxO/nbho9ETVX9ap1+WCgftm75iSXks+CoB/nkYBId8RWQJeyv5n4ZCCdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794790739;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=spbrg8AyLCNQ5x9swmn2JrPWZsDBrk0FLssfjAjiFfU=;
	b=wGQfIND1Cs6OvUlZ+VRUkrWUMZC5V9d3zASvp2fvNoqY5w8eK3Rnh8IGGpD4Z8KcxXwb
	 fhRm5Dgz8N0qGLa/fpoJaDCo8Q4dURo1in1z9rpgW55nw8arQnPySPslS2fSI0QNxBVMN
	 94vIri1Y7+yEktlui5gL8sykOp5DvoukeDlQI43dNgqLNgwU1sAKG4YhUrlNpM1vTP5dw
	 aqnGjn3x3ZAAMpMIO5iqY5vr+tD7PhdRE/rjg+m1iOqQojcBqu1a+Lfkgc74O0IoE7tGl
	 7ANvihcHmBk7Twk6YB+CgbcQDO9Lsdwb6exQHTGrX2Qwnnh7M4SyXO943nQtum7b/BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AQb3aimH;
	arc=none smtp.remote-ip=91.218.175.145
Received: from mta0.migadu.com (out-145.mta0.migadu.com [91.218.175.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C690E606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C690E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AQb3aimH
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EjkEr/neE2/QekiTzAaqP4pmiVVI+Ergqo6XektbsmA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794790736; v=1; x=1795395536;
 b=AQb3aimHG058HVBd1JP4IipeD2YBzPVHOFSjf8VSbwH7KEdhiVuKuxwLkzN5GE7Nr0mmZ61S
 1JXMIbQYjjvLYguICazKVpmw5H6ets9eASrBJPLMl3rYCUn5DqeOZBMWn1ISVwGEycsVCI+nh5b
 qw13D9FdzYpGLJjzHNaBsKjA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id f86aeccc5230d798;
	Mon, 16 Nov 2026 00:58:56 +0000
X-Mizu-Trace-ID: f86aeccc5230d798
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 08:58:49 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: netdev@vger.kernel.org, po-hsu.lin@canonical.com,
	linux-kselftest@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH net] selftests: net: arp_ndisc_evict_nocarrier: propagate
 the last test failure
Message-ID: <avpVSd7XV1lIOeZf@fedora>
References: <20261115222351.52930-1-emmaonana18@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115222351.52930-1-emmaonana18@gmail.com>

On Sun, Nov 15, 2026 at 11:23:51PM +0100, Omokefe Emmanuel Onanaroghene wrote:
> run_arp_evict_nocarrier_disabled_all() reports mismatches with a
> "failed" line but never sets ret, so the script exits 0 even when the
> all.arp_evict_nocarrier=0 test fails. The 2023 bulk fix wired the
> other five test functions and missed this one; the v6 twin
> (run_ndisc_evict_nocarrier_disabled_all) already sets ret=1. Set
> ret=1 on mismatch.
> 
> Fixes: 1856628baa170 ("selftests: net: return non-zero for failures reported in arp_ndisc_evict_nocarrier")
> Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
> ---
>  tools/testing/selftests/net/arp_ndisc_evict_nocarrier.sh | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/net/arp_ndisc_evict_nocarrier.sh b/tools/testing/selftests/net/arp_ndisc_evict_nocarrier.sh
> index 00758f00efbfa..4afb953a3e479 100755
> --- a/tools/testing/selftests/net/arp_ndisc_evict_nocarrier.sh
> +++ b/tools/testing/selftests/net/arp_ndisc_evict_nocarrier.sh
> @@ -139,6 +139,7 @@ run_arp_evict_nocarrier_disabled_all() {
>          echo "ok"
>      else
>          echo "failed"
> +        ret=1
>      fi
>  
>      cleanup_v4
> -- 
> 2.43.0
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
