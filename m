Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633719;
	b=ZVyazMfyaMcjqLDoCk7QYAgqYtGP7FLcemwybY4xE8Fjmb32xVBsJrHzMuMH208EQrh4
	 PBpFtTLbTMTjkydSChVlVUa/+/hvlir7E1zYpm0OgOxGo3w7KB3TQ4UYN26ImVYmzaBwk
	 WF9ckDLeoszQgr+K5M5zBELeo6MTM+VSb+9ktXDtePJF9tBv2eKfeDos/2joXAiUvLmZQ
	 RG2L/S/f4COQBWLN6We4BCNywBWwaWm8sGTxS9mn7hZ84EmG81t64zccQTtU0JYOaZPwT
	 JVT7o3UW9KN5qAZKZPxVgPMz7Dh3lYpO4/EPerpq0vG6qh/UpFPIjhsEYYH+5abFDLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633719;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=CSiCxUqhbAqe66y/0HULgn+K+b0JD3EtNzUt5xk4rYo=;
	b=fqpECau2Q/gx+MoE0e/kbfBSu9+ukuqHbdzwMAMUlForHvVepwYBbnebl5vs8DFrUykc
	 wSFvJMo6secD4wz89nPSQ/2Seupzk1B5nrjMQnxPrOMon2kCWgDUUUCYoNUBdnDyyE92I
	 Q/oO8s12sm9sFLnxfBLi85YsaUATsFDhyaXJlqrhhHCrH7qT8JDoyIF/XTXHyL6vM8GRe
	 PA5POEi/qxZhCup5LiMNNOrgJBEq/nC+8XNldqQYPx76SyvhET35l+AmH/HjH3GGVy483
	 2UaD9RdBK0mxymWKVlUB+1wIP5ywABLsXCfV2IoUL5KMPJiCdcXBBc4MkpRX1s7+57g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dNqMEHSu;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="OFDQ7/MK";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7917160A1880
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7917160A1880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dNqMEHSu;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OFDQ7/MK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793633717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CSiCxUqhbAqe66y/0HULgn+K+b0JD3EtNzUt5xk4rYo=;
	b=dNqMEHSuCa+KtZOYkIr7/pIy3YO9abWuQiXThEUlelC20AvyNAjGV1MlcNKD/SsKwk/zPj
	iP2GNUQ1pqZ9Xse4xhi/TltrDTSExBUQDabDMgkQeEN7eInA0CptAIOlSxUc6ihuLeYyCG
	krQS1/PqUURzIecFikwsBPt/9MYwIKM=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-bfHGrMnaPbudBfcpb1umvg-1; Mon, 02 Nov 2026 10:35:11 -0500
X-MC-Unique: bfHGrMnaPbudBfcpb1umvg-1
X-Mimecast-MFC-AGG-ID: bfHGrMnaPbudBfcpb1umvg_1793633711
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ea0fe07201so19623645ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793633711; x=1794238511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSiCxUqhbAqe66y/0HULgn+K+b0JD3EtNzUt5xk4rYo=;
        b=OFDQ7/MKyG/zh3PU913rwPGjZ43SujDmHTUJfuj6ILBub4bPeLb5W+ZlSILpfz3dhu
         Jp4IPLRBgURoUdzbSSs2jHECbXQ13TxYS7hRfXvdknAOUa5/jhsIcWaXFUsbfWRiWmkR
         18ngU3cF5p28y27Cf211gJJ3zCpScmtU5dhn5O4mKprOPXwCZ5H647QPfq7dKKGEJO05
         /gmp9zv+WAKr0v6KqdDqWC5UObACLTxNK6F0mUeHUUzPD6ED+HjfTgxQLqJPxT9C29d4
         BqLPDKYkFw8VkCi2UP12xwPOezQXxkEv7BybmYTwpIsZeNUqb8ibaR51CCzmaiwc1sPE
         G9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633711; x=1794238511;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CSiCxUqhbAqe66y/0HULgn+K+b0JD3EtNzUt5xk4rYo=;
        b=zEJhYAesags+MLEd0BlhFYyZkUTGjCSlvh1Q/60PNPil/rZ5Qa/gfoqyt3VbF4eA8e
         IVYplE2FE55KlT6hadp/N0jCW7ioQSucbHbyKxrkLXe0nu+HHrYVVM1/RfrojUZc+QhQ
         ILMlS8hKKk7SkMoBSDnystqhdCoK4F1GOCHi8ysH23UKblW+ZNo+wmQ1WlqVS7NewNIz
         xKr4i5ZMwD1XNRvki/WI4gP0We4D7zYLcB/5Uq4O4rGGsN8JXqkpd+jmje2U2ENICkGA
         2V1HvXm8sH+4csBhJFZTu2mNkFj8bYO2dL3UPH9Q11Q13D5eg2gBI4wLjRs57ByTZWuR
         Jtlw==
X-Forwarded-Encrypted: i=1; AKwUvBw7urUTBF8P/ZckceKB2cP4lj/1+RWSeB4fg0SyzBuad78omwT+9Yz+2XsfnX/S0lH0KBYdMyx7vYUJ+6s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2kEDlOnrfG7ImMQL4vVLgtTlz39BZMZe2bP/0sYuvU3dmTJ4B
	a7DGrRa02X/n08fywy4lcMWSlXeOiFLup3gaDAGZDAE3aN4wJgGr9Z3hgMvu6WyuOzToISk6h0Y
	RnWDVBb0GAaHeOcncuDeYsLpZC8LxtpFDyt+nym6u6ABXS7/EdlCNa8D7aYwwCenciQ==
X-Gm-Gg: AYBFou07dHuuPOP1cdgNHNfWSniNh9KlAm1q//NxNx0yYhhGfNM+kI7x4PAazwVltUd
	1V7puYjF/qGV/Msxe0UaqZTT55QRSHtE77cWP+G/j89h3JAsAcWXssBFqcbtEKQqfJArR4OdmEE
	3MhGkzZsUiX0n//yIwRoOXB26AJWpIjcAxfaTZe0D3w1KIM68HB3EmSGiC+G5L0DVAlma3IAS7W
	YX9wbYJXYe1HZFD/Jv4xPh4vaDiWWPaHwEgmG4asx+CAwTaRrUTp5LQJi525Qjss1+lbdBN7zGl
	LR9KLvlREu6MP0mLfIbI5M/yxSU0XJTlLRz0n27knVVCFlkVw05txYGHz4B3qwaiLvt2MCPPcwb
	KHv0cvSlN+WjnWg9v8pyX+89BWulo0+F6h+GjdrrjnFdLsivnB4FjwiiXzWXezCH8D+2sDJyyVA
	fvTHfbVjyoglZ9oldjGpu8fu7IcK9sjjkBgT59Z/KE/M8=
X-Received: by 2002:a17:90b:2691:b0:3ac:aa8d:19f2 with SMTP id 98e67ed59e1d1-3ae8985390bmr7983251a91.62.1793633710862;
        Mon, 02 Nov 2026 07:35:10 -0800 (PST)
X-Received: by 2002:a17:90b:2691:b0:3ac:aa8d:19f2 with SMTP id 98e67ed59e1d1-3ae8985390bmr7983225a91.62.1793633710362;
        Mon, 02 Nov 2026 07:35:10 -0800 (PST)
Received: from ?IPV6:2401:4900:1cc4:ec63:d913:9793:cfad:cfb8? ([2401:4900:1cc4:ec63:d913:9793:cfad:cfb8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e949077sm19269008a91.9.2026.11.02.07.35.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:35:09 -0800 (PST)
Message-ID: <4c36ffdc-ec1e-4247-9b34-bf7caafd46c7@redhat.com>
Date: Mon, 2 Nov 2026 21:05:03 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/liveupdate: Preserve VM workspaces with
 run-vmtests.sh -k
To: George Guo <dongtai.guo@linux.dev>, pasha.tatashin@soleen.com,
 rppt@kernel.org, pratyush@kernel.org, shuah@kernel.org
Cc: guodongtai@kylinos.cn, kexec@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261029090542.13283-1-dongtai.guo@linux.dev>
Content-Language: en-US
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <20261029090542.13283-1-dongtai.guo@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi George,

On 29/10/26 2:35 pm, George Guo wrote:
> From: George Guo <guodongtai@kylinos.cn>
> 
> run-vmtests.sh -k keeps the test output logs, but vmtest.sh still
> removes its workspace and qemu.serial, losing the guest output needed
> to debug failures.
> 
> Forward -k to vmtest.sh when keeping logs and update the help texts to
> match.
> 
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
Please feel free to use Reviewed-by: Mukesh Pilaniya
<mpilaniy@redhat.com> for this patch.

> ---
>  tools/testing/selftests/liveupdate/run-vmtests.sh | 7 +++++--
>  tools/testing/selftests/liveupdate/vmtest.sh      | 2 +-
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/liveupdate/run-vmtests.sh b/tools/testing/selftests/liveupdate/run-vmtests.sh
> index d656ce58c5a7..6f592aec0f85 100755
> --- a/tools/testing/selftests/liveupdate/run-vmtests.sh
> +++ b/tools/testing/selftests/liveupdate/run-vmtests.sh
> @@ -26,7 +26,7 @@ function usage() {
>  	cat <<EOF
>  $0 [-k] [-o output_dir] [-h]
>  Options:
> -	-k)	keep logs
> +	-k)	keep logs and VM workspaces, including guest serial logs
>  	-o)	specify output directory
>  	-h)	display this help
>  EOF
> @@ -48,6 +48,8 @@ function fail() {
>  }
>  
>  function main() {
> +	local -a vmtest_args=()
> +
>  	while getopts 'hko:' opt; do
>  		case $opt in
>  		k) keep_logs=1 ;;
> @@ -59,6 +61,7 @@ function main() {
>  	done
>  
>  	if [ -n "$keep_logs" ]; then
> +		vmtest_args+=(-k)
>  		if [ -z "$output_dir" ]; then
>  			output_dir="$SCRIPT_DIR/results_$(date +%Y%m%d_%H%M%S)"
>  		fi;
> @@ -74,7 +77,7 @@ function main() {
>  
>  			printf "  -> %-8s %-24s ... " "$arch" "$test_name"
>  
> -			"$TEST_RUNNER" -t "$arch" -T "$test_name" &> "$log"
> +			"$TEST_RUNNER" "${vmtest_args[@]}" -t "$arch" -T "$test_name" &> "$log"
>  			exit_code=$?
>  
>  			case $exit_code in
> diff --git a/tools/testing/selftests/liveupdate/vmtest.sh b/tools/testing/selftests/liveupdate/vmtest.sh
> index 69beda6c961d..bd7032c4b122 100755
> --- a/tools/testing/selftests/liveupdate/vmtest.sh
> +++ b/tools/testing/selftests/liveupdate/vmtest.sh
> @@ -40,7 +40,7 @@ Options:
>  	-t)	run test for target_arch (aarch64, x86_64)
>  	-T)	test name to run (default: luo_kexec_simple)
>  	-w)	custom workspace directory (default: creates temp dir)
> -	-k)	keep workspace directory after successful test
> +	-k)	keep workspace directory
>  	-h)	display this help
>  EOF
>  }
> 
> base-commit: 9a6a70aefe77f6fb9ff2b3037dcf87f6dff65c8c

-- 
Regards,
Mukesh Pilaniya

