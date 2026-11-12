Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461825;
	b=HHTQ7E5TUazEiwVAHSgUq+7BpH11gtUGiOryA8cMekExNE7i6beldr/8fqRxcLkVD3R5
	 TZX6bsDpXASC0rUGRpUCBhNuMg3eLrvRZbGLAWwqNXDxbUIKlrID09m1tnl7DL/RE0856
	 Y9F5Qfy5HEPYImLniVxVwPJVl/St58UeuzwG5ynnPk1PylPtN/q15wLvs7AOuVCQL9MY4
	 6+umAUrKsFv2FmIt+3GLDu2Y8PXvN5Bn2LzXPi+Je9HVGFLB19VoGIMcEnF8iE3ZYI52L
	 KFUujqdLbKTe6Vqz9wAzoslRbNyL8G41DnM518Q0zwMqLaFhPW1mDsikhWiMwTie0YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461825;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=EG9t4mZCkW5bj94FWQdTBwdy/NVixZXrhszDaNAIfek=;
	b=5f1lerMtENtaJ2AcxyXP6YDH0+dhNCeUkn3OA2aT1BETodgRb8CcJx5hpF9bcb0KBhs9
	 DWtx0euPFv0r2Y6URONzwSiffdGExpd8/Afkt/YfECsV1Ye5jZ+XDmlkI9mscCsamRCL8
	 ne85EyPK5Q15thX5I40nKkI7C04K2Pdfo24+LV9zZ0Y2xAoKzffE7xjLxDcLfIhKGQ1vd
	 CpcK2Zd9XZQ/ZEbNbNq6T8vmQzIR9bwkOCo6Wz4ePA6lwk8lmmUP3PRqKDZg8du2YIP2Q
	 pm8MshPvLsHPaorxQ2P1lavfm5GYNhRe9IOxu4wzbb5BjIJC/CmYctUhJXUqkbVRtXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=PQzR9qQI;
	arc=none smtp.remote-ip=95.215.58.142
Received: from mta1.migadu.com (out-142.mta1.migadu.com [95.215.58.142])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4EC606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E4EC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=PQzR9qQI
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EG9t4mZCkW5bj94FWQdTBwdy/NVixZXrhszDaNAIfek=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794461822; v=1; x=1795066622;
 b=PQzR9qQIbf3p4A6OWITxFkEazjhTHdcwK7OI1p4iFcr8SPq+7VSMyf4XnRUKbDv46KMeCvmA
 S/wt951G7wn+0UBeO/l8PJGFm9Bs0jLxRXBioeWSBcc9PyG4Y5PGGPAR6WsG5k1u6xV3G0a+3BB
 TYocxRN4QlHq1XIuWLf+Zbho7ApxQDUsQcBtoV7EWb17Z5JNClD/iEt6HwY2AlUkTDSZD9HhPLg
 DYV1qoenas49Q9Y0/RiCqhOJgzWCpFI4hL2DK3Cr7VtRYBf+P5Vz5tA8nUiMM5lemdQQIQ3xC16
 zAAsQs7M5/z+VGBgjVgMIVIdNaNy9qtXDvUDZV5kkqXcg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0f7c7ee188fea858;
	Thu, 12 Nov 2026 05:37:02 +0000
X-Mizu-Trace-ID: 0f7c7ee188fea858
X-Migadu-Flow: FLOW_OUT
Date: Thu, 12 Nov 2026 13:36:54 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/25] docs/zh_TW: process: sync 4.Coding.rst with the
 English original
Message-ID: <avVQdrfqVqRfY5ex@wyuan.org>
References: <20261106113142.706783-1-chenyou910331@gmail.com>
 <20261106113142.706783-4-chenyou910331@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261106113142.706783-4-chenyou910331@gmail.com>

On Fri, Nov 06, 2026 at 07:31:18PM +0800, Chen-Yu Yeh wrote:
> -內核長期以來都有其標準的代碼風格，如
> -:ref:`Documentation/translations/zh_CN/process/coding-style.rst <tw_codingstyle>`
> -中所述。在多數時候，該文檔中描述的準則至多被認爲是建議性的。因此，內核中存在
> -大量不符合代碼風格準則的代碼。這種代碼的存在會給內核開發人員帶來兩方面的危害。
> +核心長期以來都有其標準的程式碼風格，如
> +:ref:`Documentation/process/coding-style.rst <tw_codingstyle>` 中所述。在其中
> +大部分時間裡，該文件中描述的準則至多被認為是建議性的。因此，核心中存在大量不
> +符合程式碼風格準則的程式碼。這種程式碼的存在會給核心開發人員帶來兩方面的危害。

Sorry, but wait a minute.

You used <tw_codingstyle> label here, but after rendering, the html
output is still "Documentation/process/coding-style.rst", which is
pointing to the zh-tw translation, not the original one. So it is
inconsistent, right?

During my review of these patches, I didn't pay close attention to this
point. I'm so sorry. I originally thought that the compilation of Sphinx
would have pointed out the problem like this, but it turned out that I
had misunderstood the grammar of this "ref". Therefore I can see that
there're some instances in this serie doing like this.

I suggest that in this series, either use the full path to refer to a
file directly, or stick to the discouraged writing style and wait until
once these two series are completed, we can then carry out a thorough
cleanup. What do you think?

Regarding the "ref" of one specific section, I remember that it could be
referred to using a relative path, and with a label?

So please drop my review trailer, or directly point out that I'm
misunderstanding this again.

Thanks.

