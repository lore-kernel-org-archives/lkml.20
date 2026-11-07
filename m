Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794052557;
	b=WPwFcBLG8h120k1UOz8lLxWaLQdIsFJmd8VE6xEkEJbqe4xJOcymXi8HWiXEClBokXCM
	 4Cd0E+7c2EzPY7I9DHdXKzqVBzZGuME7NzCmrMPeOn7TzKfFlUtXSkVbT3UwwiSL0qJfn
	 qaktu3iKpQI78Pfgp5nMUhZoF6Icqib6ZZCi9M1Vs7J27a+3R3fQsKhh0hG1ih1aufld9
	 7hg+161fkbS6fKkEp3FVrtkGVweK2nLd8ER9mMPUkNf0DzKaRFmYg4HpF1rK6vhxHJVfW
	 1Q6XV3rI71LmGytAKnN4KRvI3AehIem8FYytZL4pMUVvHiy9Xgi0CaP658Wibf1BPLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=jA1siZ6Yj5WBN9QXKIn9ZgI/8sODR7fw6w8L8iW3nQix4vGI+gkJnPJpMoRoARokWloI
	 zI/JITcJ3LX7wpjvCkajoPjLy1ClIahjfvKs5aJ5L9Se3qXzoDcavUsEBi2CcbxN4wnlj
	 Jv8HhlBjpxHnZQ4ynSLqMcA0k1rWq8sIPkYVosuds9iO2VMYsWR8Ilg04d5h0Iv0Eh8LS
	 ZpCzCPg02nqY0OTE62UaOdqn5cfhiW4PPEvcgI3pZf3vwHKrkBxcwj0YygdzHPPJeaJtt
	 498maF01HtEIaXqNME/1GkW89HuxNRMn9A90AXyx8xfzOdvDJ5RLXq3xRuK+x9309BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zeh4vtiH;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C35F606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 11:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C35F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zeh4vtiH
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso2338577eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 03:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794052556; x=1794657356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=zeh4vtiHSkORdzDCz+sg1Ik/yrjHIxYdBaPlsymLlupYOdbmACbmjwnNeCc9u+MRNC
         BfO/ZawTeadAT4yXSPjIzEKOHXn1O5pfOm2fsI4msID72zTVYiopUPnjFnu6GUJNMOc3
         SIsynd9XDih2RuGxo7/FrPrR+iSbqO03WtTdpqODQziiY8VuZZ0ejd82CQRV/rPEUu//
         zerchnQyXML0YMHpt82+QuQqIQhrSAahRVJIeAyQZqmveo5x0bRxFKjcKsSvvpCM/yht
         g/p3ttPKR68+GECNpwHQLshe+zxwNnycjstDIEV+7zE90QBhgyIy0Bp87VMCwUmZJTy3
         99TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794052556; x=1794657356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=qJ8T9A67sdsdp9KhBCcErQxJpcutr2SejFcwxbF16S/+Grzqsu1lyXSQYZjM89yBVM
         uLoHtXGZ+XHB97JUn3yLTmfLDcp/6JNjoTRct4a60A1Tj0F8t9nMkgGwAvLiRYKWz7vG
         gGmveXsR4F5ZgVgNuU29SDcVSn4iJJWLmMhNYF69rP+O5qs43Hy8gKrMucEa3wEGJzsW
         sRBRA3Qe8CuxLTUCXJZEyp9DtDl0MARR2XvrYBBt+PZz9lq3PCffMGW4m5yfGiMfUI8N
         CEyBaSKhj3/p4BOmncqkk14XPjb3jWVNNg3lLUe+o7F4TfoECAJAeGCUH2Rchw1L5ZKt
         lAzQ==
X-Gm-Message-State: APuU4Z/nc1h6ojKfDdrhit3E1UVbfUXaNtXCD9TSQaEvTfrYrnTZpfWc
	hy95OZHQvZQt6kVd4+5DJpqOqpqS0he0+Aa/YqT8M922KNNuDAgQd3Kj
X-Gm-Gg: AYBFou3/yXrSjLbfLiXGiuBWvhYa+C0Wc1j4st4tfuMhkQiQT2hPPmqNqYMHsl+BVxq
	E7sv4k2niCepj4CdUAI7ghX2kcauo4oEHnQWtmVbe07F6vk3JQ/E0mv/ne0zd4Lq/F/xHGyo4j0
	wfMkLSY8MOqCcRvnS6/ZuLqk1Yz1mg5CPx6ur6fo18DBjqI136Ow02tNExgskaMdb/1Hs8+4C5J
	JEqSKVzi7k7g7Wy6Golgnd4rT+vh92KebZypgWX915KSB3HpxDVLPckz3jPToFPqNFjUz2cp1Yt
	dleBJdLQTfE+gcxVnfwuWnESfVQGVeRd02wA6iaxshRb/GTf7mY9fQQpSDOXDOVvvvIhZJp0Mgw
	xK1X5w/wfzZENvQDTDaz1DlTbky438EpPswcU/xW882X14T/+FGJ5AdqxAvmuXQpYFTXPIGQdR6
	mCcWkG6pLZ0rtEVYchq7katS9Z+z5WU/U/gynwqZnIVNnulr1ucvRGZUQyQSxzjE89Xlcij2I2/
	/IfwnA5GGpEP3xndXrxxGb2PhhJsgB1AT2juXztUlGaVJYqmSjo3kP76Rcdc2qfq3hQcJ+hXZXx
	se0lTNcmPWKToaoJqS/eOOhy2v/tiJ2rPJpy8HKTpdJipYycjrKq
X-Received: by 2002:a05:693c:808b:b0:361:1dd6:531b with SMTP id 5a478bee46e88-36f7682254fmr7638705eec.26.1794052556398;
        Sat, 07 Nov 2026 03:55:56 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8c4f28dsm14440717eec.9.2026.11.07.03.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 03:55:56 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: control: Synchronize LED mode accesses
Date: Sat,  7 Nov 2026 11:55:34 +0000
Message-ID: <20261107115534.2748-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87eccxyplk.wl-tiwai@suse.de>
References: <87eccxyplk.wl-tiwai@suse.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj
