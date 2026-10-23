Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792720090;
	b=N0mCeX7iEiZPlI0vNR5q6upsUI4R9QhaGmPiawtQCIMwsr9vihCyfkiujyCJLJW27D4/
	 pZXEYjiSW53IisMjRxeJ2G5DfmLJCY8fL56NTGMsfQNK8zUiRs7uIjQ83neaDDVcPM30b
	 IfiAkZcRcmT9Tnc7UkiyieNN0Sd6adaOr3zJhUQhi4p1T8v1TjNnSb/hoGU5kPwQuFbU4
	 w5Lt4DzhhjC4vW77UDEqZC9mTeBM8GretX8EGxSbVVJL1wI/XYdm46qcYPEU4wnstEujr
	 7vXtVVArPfGC2GyB8u0nTIWgNcM/lYCBOWoloKpNHJ7y49mdDHwW+2vzdn6N0LaGs2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792720090;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=K974vEkl7HviH9zH+bkMsQvo+7f18yyRhOODa6fRHas=;
	b=DUfvHSOWGfhpdoZ99JZi2zuEqZ/vfMQxWKA3yUvmTI+ZpZjhpBE4Ymlnpq11Ta07cWFW
	 OSc0H2eeZ9DlYFg5O8Ef1c0g+ptayVTorfaMjgQ9te+8zO49ATfokbAXlupWhNN2OdGMn
	 cbLamQjd+JKed4AUfiLb48meJWgHgc2oN5T54cyYrgwLZ4eIVs315j2e4gtYHG0dWh40e
	 yjmmbn/SW56NrVOykik4b9g7am8nA4jpcvgHROT2pZN9uwKasJ2iksKZe7LzGmnmBbs+J
	 96aduvziYLYprYUXZP46ExuCuMyOUwhdeatGdpcdkIzEti4HAMIjnXJB88evcgp9+IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PBx49Lzp;
	arc=none smtp.remote-ip=91.218.175.15
Received: from mta0.migadu.com (out-15.mta0.migadu.com [91.218.175.15])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F46606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28F46606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PBx49Lzp
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VPNQpDtmsXoZKn9VI7oWOvmenOOysxW0h45w0IjOb3A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792720088; v=1; x=1793324888;
 b=PBx49LzpcsGrKpaFh7cMvZ7IcI4BwoJhIGNJzxr+gMxz1YeZeAHbDHgA46lcvUkS5JzT3A8X
 Yu9Q4kJE1zT1e0Jg+OFMOGCqvQ/ZxReOS+YlfUFvGYfNB+blw7gAotcUImii2w80lWOTfys5+ur
 wpfEkOH+cnyazwZbFPh+g1rE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id cd0afe3d7227279f;
	Fri, 23 Oct 2026 01:48:06 +0000
X-Mizu-Trace-ID: cd0afe3d7227279f
X-Migadu-Flow: FLOW_OUT
Date: Fri, 23 Oct 2026 09:47:52 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Xia Yan <yana06070@163.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@kernel.org, horms@kernel.org, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	pabeni@redhat.com, shuah@kernel.org
Subject: Re: [PATCH net v3 2/2] selftests: net: check veth carrier after
 changing channel counts
Message-ID: <atq8yKbnqtLBVucH@fedora>
References: <20261022085842.2527-1-yana06070@163.com>
 <20261022085842.2527-2-yana06070@163.com>
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
In-Reply-To: <20261022085842.2527-2-yana06070@163.com>

Hi Yan Xia,
On Thu, Oct 22, 2026 at 04:58:42PM +0800, Xia Yan wrote:
> Extend veth.sh to check carrier state after changing channel counts.
> A running interface must keep carrier off while its peer is down.
> 
> Cover up/up and both mixed up/down combinations with GRO on and off.
> Resize RX and TX queues in both directions on each endpoint, and check
> that rejecting an out-of-range request also preserves carrier state.
> Use two queues explicitly so these cases also run on single-CPU systems.
> 
> Keep these cases with the existing veth tests and reuse their namespace
> setup, cleanup and aggregate failure status. Only check LOWER_UP on
> running interfaces, where that flag exposes carrier state.
> 
> The four mixed up/down cases fail with the unfixed driver. All six
> carrier cases and the existing checks pass with the fix.
> 
> Assisted-by: LLM
> Signed-off-by: Xia Yan <yana06070@163.com>
> ---
> 
> Notes:
>     Changes in v3:
>     - Move the six carrier cases into veth.sh following review of v2.
>     - Reuse namespace setup, cleanup and error reporting.
>     - Allow explicit queue counts in create_ns().
> 
>     v2: https://lore.kernel.org/netdev/20261020135544.24441-1-yana06070@163.com/
> 
>     Testing on the v2 baseline 513444cc62e2:
>     - Complete default veth.sh on x86_64 QEMU/KVM, three vCPUs:
>       before: 57 checks pass, four mixed up/down carrier checks fail;
>       after: all 61 checks pass. The 55 existing checks pass on both.
>     - bash -n and git diff --check pass.
>     - If creating the veth pair fails, the case is skipped without
>       masking failures from earlier test cases.
> 
>     Both patches also apply to net/main ffdf678dd166
>     (application check only, checked on 2026-10-22).
> 
>     The QEMU guests failed to power off cleanly (initramfs issue) after
>     the tests completed; the exit codes above are the veth.sh results.
> 
> 
>  tools/testing/selftests/net/veth.sh | 84 ++++++++++++++++++++++++++++-
>  1 file changed, 83 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
> index 8b867e0..901ba51 100755
> --- a/tools/testing/selftests/net/veth.sh
> +++ b/tools/testing/selftests/net/veth.sh
> @@ -41,13 +41,15 @@ create_ns() {
>  		ip -n $ns link set dev lo up
>  	done
>  
> -	ip link add name veth$SRC type veth peer name veth$DST
> +	ip link add name veth$SRC "$@" type veth peer name veth$DST "$@" || return 1
>  
>  	for ns in $SRC $DST; do
>  		ip link set dev veth$ns netns $BASE$ns up
>  		ip -n $BASE$ns addr add dev veth$ns $BM_NET_V4$ns/24
>  		ip -n $BASE$ns addr add dev veth$ns $BM_NET_V6$ns/64 nodad
>  	done
> +
> +	return 0
>  }
>  
>  __chk_flag() {
> @@ -130,6 +132,80 @@ chk_channels() {
>  	fi
>  }
>  
> +chk_carrier() {
> +	local target=$1
> +	local state=$2
> +	local expected=$3
> +	local carrier=0
> +	local link
> +
> +	# IFF_LOWER_UP is reported only for running interfaces.
> +	[ "$state" = up ] || return 0
> +
> +	if ! link=$(ip -n $BASE$target -o link show dev veth$target); then
> +		echo " fail - cannot read veth$target link state"
> +		return 1
> +	fi
> +	case "$link" in
> +		*LOWER_UP*) carrier=1 ;;
> +	esac
> +	if [ "$carrier" -ne "$expected" ]; then
> +		echo " fail - veth$target carrier is $carrier, expected $expected"
> +		return 1
> +	fi
> +}
> +
> +chk_channels_carrier() {
> +	local src_state=$1
> +	local dst_state=$2
> +	local gro=$3
> +	local expected=0
> +	local err=0
> +	local target count
> +	local msg="carrier after channel change ($src_state/$dst_state, GRO $gro)"
> +
> +	if ! create_ns numtxqueues 2 numrxqueues 2; then
> +		printf "%-60s" "$msg"
> +		echo " skip - cannot create veth pair"
> +		cleanup
> +		return
> +	fi
> +
> +	ip -n $NS_SRC link set dev veth$SRC "$src_state" || err=1
> +	ip -n $NS_DST link set dev veth$DST "$dst_state" || err=1
> +	ip netns exec $NS_SRC ethtool -K veth$SRC gro "$gro" >/dev/null || err=1
> +	ip netns exec $NS_DST ethtool -K veth$DST gro "$gro" >/dev/null || err=1

Why do you do gro setting in rx/tx set ups?

Thanks
Hangbin
