Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B45323E35F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 03:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788750582; cv=none; b=mkBtVvYFN8FSSDmdvOyrA9sJkvV7KC95Spd+nJc/QfkMP3sSAR0SXToreBbMkZDJ4w5Fljyb715bH9DzO31nCa39YtUfoDmKLUVkMfYaYC9eVor1B2FZ+LS55JHJwjzRQn6ixoua6zpGLwbzA8BiV+AsO+G098AS0gXVCRP0z/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788750582; c=relaxed/simple;
	bh=UrFBnW1/fICcEXztg/0e2RNDkiLJvVUN8TInCHRb3yg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gbW/P9hym3zUdk2Rzp7FGvzzeqTEy6+Po07Ffmfqs1tHufCyQ07I3fnAWZVM26RvZdvo/V6GIEJuvnZuGFtvlEji794njl1o4S2lzWTljcRandZsrEAlJnbL09kuGg7MPw4YaTjG2Km7HaQ1tehhu1Y3LKwyxvmWkOdwgl97mJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn; spf=pass smtp.mailfrom=kylinsec.com.cn; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinsec.com.cn
X-QQ-mid: esmtpsz19t1788750506td1c3f24c
X-QQ-Originating-IP: nDhhRbWgQjHqGOc9extJi2gMysH1x9Xa1OyXHlJP+Mc=
Received: from [10.200.8.55] ( [175.0.204.93])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Sep 2026 11:08:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6137544479074970621
EX-QQ-RecipientCnt: 11
Message-ID: <9201C88445F7D464+7ed4f829-b987-4259-a228-37d881e303d7@kylinsec.com.cn>
Date: Mon, 7 Sep 2026 11:06:35 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: syscfg: fix deadlock on device registration
 failure
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Leo Yan <leo.yan@arm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Miaoqian Lin <linmq006@gmail.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 qinyungao@kylinsec.com.cn
References: <604ED754D4669F40+20260825014717.2346-1-dengyingchao@kylinsec.com.cn>
From: yingchao deng <dengyingchao@kylinsec.com.cn>
In-Reply-To: <604ED754D4669F40+20260825014717.2346-1-dengyingchao@kylinsec.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: NAtipnnbTPea2ScznlRZygyEL3WmDPcIAdDGrz0epiF9CKN1/SVDQDPH
	L74oknimUVzwvQMz5dKTOIF5iqe6yu0/R3cX8YLEVpMfpBtiFh5USZNStd0AbOcRrO3vLcd
	gi/LmNn4M7mQENW1xjbbU7xMzLHm2OiCeSaXCeT1Fz+NJthTDPW+ILAw5KG1ZaSY1VXfzyO
	tjsliORoSAkj8Uqbgp+7h2YuAvYbTqctrWk8X/oVFbWMC94xXFrkj0uMfYv+WsSq9SAIVdx
	2DMv8ThxxbvHlZjq0FCKmhrzHIlnovaEhlbAvtnnSZKXHlEz+oA4QqRiNh5HN82nrdQHIoR
	3HYIaCfeC6iSEWos7ENFiReOWzwgQEHyLqInAQHaNLjdIJog0esENfm4V5adsQmQdZGeiqE
	YFK3bPcYrgFutr19rr0lWYjbM0lDIqminAiVlHIRnCv26tR/Ws6TWt+KZ0dT3jM2x0vwnwV
	FfkO0oAhlHt5hGp4qHgiGdf6seiXi/IWb4jWYsjnJ1fedn9gkOp/HwM8lVdD9vpvuCcm831
	3S+D2crcvuivYtczMARYkfPSA5TYon58OU23bCxpmSaM7pUqn9QVd2ntP+EiDjtNKmvCD1m
	hFFSJqAPMYfHzlwS97LtDJc7aosisbS4tpqeI+6fvABx+Cg9e23MgtVm+4g6cnrnCBDPT9x
	KKV1WIV7ImrAk9KzAr5hTB0uItaoXEcPqEbDacOsBwGYK4/xYYFkgcplSyByX0GfDVcvKvu
	kvff0wV7isuM91NQGPdOekwBlUckxivU6DmFlkFPKbVjqo6KRMWBIG93vRiZXP6QxDJ5UR+
	AUvjdRXAfsPkigGPGaydr05HtTEkyp8w6+TAfj2rajsnwzJa4K9bgbV3+YTwRIW7zJMFD0c
	quuSTixb0z0Y8CO5wx3LuK1jR+4kTXE9+weVLhNT6qUMpKu31eYfNatSWZNLfCksMdZq1kP
	uc1VvGpHxpIN1utT5wmV3HmDlbOlpZS6s0Ls3XzfLbBV1oIjBcT0SAXedwxpgh22j7lwv0y
	VZ29GuuonyaL+MPmlhmGDQKSxdet2WOfAH9FLn+A==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

Gentle reminder

On 25/08/2026 09:47, yingchao wrote:
> From: Yingchao Deng <dengyingchao@kylinsec.com.cn>
>
> cscfg_create_device() calls put_device() while holding cscfg_mutex.  If
> device_register() failed, put_device() drops the last reference and invokes
> cscfg_dev_release(), which takes cscfg_mutex again, deadlocking.
>
> Unlock cscfg_mutex before calling put_device().
>
> Fixes: cfa5dbcdd7ae ("coresight: syscfg: Fix memleak on registration failure in cscfg_create_device")
> Signed-off-by: Yingchao Deng <dengyingchao@kylinsec.com.cn>
> ---
>   drivers/hwtracing/coresight/coresight-syscfg.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> index 2bfdd7b45e49..d0e7e4720e46 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> @@ -1210,8 +1210,14 @@ static int cscfg_create_device(void)
>   	dev->init_name = "cs_system_cfg";
>   
>   	err = device_register(dev);
> -	if (err)
> +	if (err) {
> +		/* put_device() triggers cscfg_dev_release() which takes
> +		 * cscfg_mutex, so drop the lock first to avoid deadlocking.
> +		 */
> +		mutex_unlock(&cscfg_mutex);
>   		put_device(dev);
> +		return err;
> +	}
>   
>   create_dev_exit_unlock:
>   	mutex_unlock(&cscfg_mutex);

