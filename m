Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB7A23E358
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790640731; cv=none; b=Q7fDOJyLrgo6qNU5n4xxLsmNzoMfs/mVwyqC+nVQQFBqkFvlqK0DJx/kDlHSh+k2SqzNXT/I1oXFXVKd4eKDaHGIJdngmmPG2ugQSgLikZclGBFATyZqwD7NoN+17WqOfptrtgnH+KTV0EEHdNwG8TRAotGLVxBwNLNuLYsknPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790640731; c=relaxed/simple;
	bh=Pzs/2H8JRIHvRetc0eSOxZTr5wzjgXHRsjatXDajVME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZfvVE0OQJtKRwkp+3lMhYz6dO9bkcE/7p3nD/hfnGsvMzZSCLKuEKFR1ss+U8SvnCMbUZXoscsjvA6LED3y+q+nxR0wdHS5jUqwXiTDnxUjCCYGmNbeIQBZEYh0dI6yQXXstlFDMOMwwVK5osUinZ7eejqA/bkdhVUBINsvi6WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=sJHkD6db; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="sJHkD6db"
Received: by mail-pz2-f42.google.com with SMTP id d2e1a72fcca58-86dd69a1b15so690679b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790640729; x=1791245529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AbuNkQK/L+pg/yDlIMlRRHsYuQVsJSZCaklGdmmjYtU=;
        b=sJHkD6db9Hl0cXbcdtRCKhhsPfSO9fmYRqX5GRLK4j8nR0+DTuzr2Mj7x6DP9/fW8n
         53di/AhkvgywJT0vPb2I0GV5uWH2utXqiOUeZy8u67Efjpw7bGBhWTSgTsYqeEWkOQWu
         w1tf39UuSuNzKaLwGRD2UhpgRdL9/Ic5eimGDp73MSQhQADa0oGPiy1PHvjlHrNTVYdA
         +s/l3G+KRhM+YztLF0Mn6F9XOtUp7e3qcEjc25CmmaC9l3sHgoGsy7051D4+tdeWCUND
         qbh1lZELulCXP19zdlIFR8YUeED3RbGK+6NAhbU30FZ4YmHFyZs36DEsc2udPLhH7yRe
         Gw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790640729; x=1791245529;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AbuNkQK/L+pg/yDlIMlRRHsYuQVsJSZCaklGdmmjYtU=;
        b=g4W7L+36yJPVGZ+uZgr3v6Lwz6k3Jlao5YNtpcWPWFlMJcMKzKKeXgJOSTVTQ91sag
         f1V4G7pFdhj588tWtTlS+fjbtshszlyCsLr70W12Zqzb3SBew4DFL8vixLU1V55scemV
         9QU8/mFRqLK9Y8XdA5l5m9CoTIhESFaU+FBXGO2zxRx2sDh33pwS+z3/9zicTFy9DBPl
         SO5bdSaxN/jR8V8PxF+pQW+VD7TV31S17nHwaSGmVoKDyMowFOETedQPEROHtHMUOjlT
         MELeJ1DxnkGt+P+Hr/Yq1Z+pWBZfRY/jjvZJJQQRSBnIaWsGIh6Dl/eiuk+iPNvihLsU
         C4wA==
X-Forwarded-Encrypted: i=1; AKwUvBzWLjuJ4ui3LjqXpp3Ns/da797CiplLpCfdeYq8CgSFuhVRNJKrxKREwn+dPpt4BHXW67BLoPy3vX2hiAo=@vger.kernel.org
X-Gm-Message-State: AFuF++nydBecn0L9KHbvvC4xrwzlu1Jst4BKi9DK7bhSP/16MXT8K0GA
	rGC+vT1NLTkyU6jcQtcI7a8JjXgMveCTpR64GgDkvdNQNG6k6EcBwScm1eoMauq5y28=
X-Gm-Gg: AYBFou2gahAwBjVFRkAWEpSZ8Dx06U3bRzlgaUSktRiqAsi6niP15mWPPK7auoQp/EI
	VhLesqdCbENG0/LaX6/rY2GibeahNWh8dnUbowfzJbGsDdW5z9D6K0hgwBY9ghte8ViDdO1uJFR
	i6pqQ1WfHPNaTlzZaIrlsd8QtP/tjuGV1fgXkhwTx27sQt83Z5MU5dRCA6iYsRNJ1jR9UqL5UEQ
	uHZGmKt2tTkTMEh925/RPdeEW+flW+O6xaAyvWa8h1N7cGyPcKovqPWo8xjC/W/BJbtjgeEpAd/
	B8Z7t/wbfF3OG1WLPXJVkaX93UemQr2EPiQTdNFSzY3KMT3JS4/1Iqwo4nCzIaelnulfx4FsP4f
	SVtHgFsyBBGbjoydQsyjcuCMuf+PNM2DYtu/zAUp9Cv4XjZlTkXKF4Lc9uqBL532pfe3ssctTB/
	Azkf9w56RfHKZmXPVkzy6C1jM6hosTUNJjAhh9O+tsSU/RfvvnkAfQCTo87pzBlG38MkvF8oJ6E
	h6o6W342vK7
X-Received: by 2002:a05:6a21:6e8f:b0:3de:4a1c:a93 with SMTP id adf61e73a8af0-3de7cc0d205mr659922637.28.1790640729533;
        Mon, 28 Sep 2026 17:12:09 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:51::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8800974cdc3sm4708243b3a.6.2026.09.28.17.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 17:12:09 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:12:08 -0700
From: Joe Damato <joe@dama.to>
To: Sagi Maimon <maimon.sagi@gmail.com>
Cc: netdev@vger.kernel.org, radhey.shyam.pandey@amd.com,
	michal.simek@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	daniel@iogearbox.net
Subject: Re: [PATCH net] net: axienet: free outstanding TX buffers in
 axienet_dma_bd_release()
Message-ID: <arsCWFmUhSYkhcCv@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Sagi Maimon <maimon.sagi@gmail.com>, netdev@vger.kernel.org,
	radhey.shyam.pandey@amd.com, michal.simek@amd.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	daniel@iogearbox.net
References: <20260927081034.350422-1-maimon.sagi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927081034.350422-1-maimon.sagi@gmail.com>

On Sun, Sep 27, 2026 at 11:10:34AM +0300, Sagi Maimon wrote:

[...]
 
> Walk the TX ring the way axienet_dma_err_handler() already does: unmap
> every descriptor whose cntrl is still set - axienet_free_tx_chain()
> clears it on reclaim - and free any skb still attached.

The code added in this patch and in axienet_dma_err_handler are almost
identical (as your commit message suggests). I am wondering if it's possible
to factor this code out into a helper and instead call it from both places
instead of repeating the same code?
