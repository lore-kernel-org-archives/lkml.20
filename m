Received: from out28-123.mail.aliyun.com (out28-123.mail.aliyun.com [115.124.28.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F88D3603D7;
	Fri,  4 Sep 2026 09:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788515941; cv=none; b=LhaZarkTxcHuOPmDKxKTkniZhShl5WQKqnnp5UkV2OHfI6VGkuGgbUmYOQ0GHDlGReveBy/tfS90c5ozpIc1Jiw5qYueXYz1eZizYw75LELRbhy3CEjApYstNcJd7Kpbkm5Uk9DDRj4t9u03ehK1DRR42u4BcyJ2eMjjMfqWOd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788515941; c=relaxed/simple;
	bh=HQViSQ4ntPj7VlB4vDS+HY8tM4tvD2mUlR7LR6PztEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t0xJKHnUVarakePhXiBexeCzJ7CcwP8xfHUJZqm4DCciBzlu32MO3vS3Xvxburv2FgkMDol4vWsmUdLnVImXA3CJs28fMhBwHfjSUWru4j0vCvv6J7CdhbWUOBDioBkqC2UvdYOR/vcTh1ZhS7bFh7ybhLzywcP4lDtDYNDxNHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=edatec.cn; spf=pass smtp.mailfrom=edatec.cn; arc=none smtp.client-ip=115.124.28.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=edatec.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=edatec.cn
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1167419|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_news_journal|0.346649-0.00663473-0.646716;FP=12249649571491665958|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037021217;MF=zjzhao@edatec.cn;NM=1;PH=DS;RN=7;RT=7;SR=0;TI=SMTPD_---.j5U3U1O_1788515927;
Received: from LAPTOP-VQRD5F43.hs.edatec.cn(mailfrom:zjzhao@edatec.cn fp:SMTPD_---.j5U3U1O_1788515927 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 04 Sep 2026 17:58:48 +0800
From: zjzhao-eda <zjzhao@edatec.cn>
To: Shuah Khan <shuah@kernel.org>
Cc: zjzhao-eda <zjzhao@edatec.cn>,
	Valentina Manea <valentina.manea.m@gmail.com>,
	Hongren Zheng <i@ithal.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usbip: host: ignore number_of_packets for non-isoc URBs
Date: Fri,  4 Sep 2026 17:58:45 +0800
Message-ID: <20260904095845.106527-1-zjzhao@edatec.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825033623.332537-1-zjzhao@edatec.cn>
References: <20260825033623.332537-1-zjzhao@edatec.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Shuah, all,

Pinging this patch from a couple of weeks ago in case it got lost in
the merge-window noise.

    [PATCH] usbip: host: ignore number_of_packets for non-isoc URBs
    <20260825033623.332537-1-zjzhao@edatec.cn>

It sanitizes number_of_packets to 0 for non-isochronous endpoints in
the stub, which fixes an -ENOMEM/reset-loop failure with usbip-win
clients on dwc2/dwc_otg hosts. The change is a strict no-op for
well-behaved clients (Linux vhci already sends 0), and it complements
the existing number_of_packets validation added by c6688ef9f297.

Would you like me to rebase/resend, or is there anything I should
adjust? Happy to make any changes.

Thanks for your time and for maintaining usbip.

-- 
zjzhao-eda
EDATEC Technology Co., Ltd.
