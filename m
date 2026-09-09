Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0702C16F288
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 05:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788930964; cv=none; b=glseAgUrSBkK7pqbDKiyqmguJIkIcepHp+Jz/iCa/OW/53jAzyqbyIeLWlkYno1FjZKd921hOw3nlheZHqflbVSY0TyLQz1TaenwpPfqldQv58y12SS/D8ndZX3bDzUWLk60lzrQ5iIu87baI58j6c6TK/CYKZ9PLWFgBiDM6W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788930964; c=relaxed/simple;
	bh=Y5VD61VcseLUj3Wx2/Pgy8b5mzwV7DglW1NF+OC3BJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOPe50mQ2QQjvNeAlbVFHxgBrEWzxnrRLJ6jb20GGS9RKQ4hKPrpU3mzDFIP4PwQws80IikrErcrPGYDHeYtHdoJzzvlOrNTIqHNXRUSJgLiZ0vjAtzdjuj5AtsmRPP6vDocirED7293eoY8ulI3VztP8QO5WncxGphqbb62vWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mFPfG2jh; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mFPfG2jh"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso4607873a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 22:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788930962; x=1789535762; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Dizj3C/uiB0OjdqiLkkdhcvIiLwfs6+aR2Rr8Cl6Hw=;
        b=mFPfG2jhclkuDmyJGs7CoKviSqc4YDm/rjsxh1TsgFV/t2L0o/kE3C9NuGFbAEXI0c
         WrFy/RTDPr/J5kpeDtSfAiLu8wyoUZ2Qm4904yKQ1hRCLFZ4a23k4yv+DpEpgygRIFdu
         UW5L60iAVdwq8XYsRzhiQyZXZTJIrlP/XsRdFG4mwKaQReAP2/KZJcvuJ+JMgFklot4K
         M3DjcOa42AARVGTxcxP8DK3eNbpnUk9nJCLd/0wRlz/RG1m4qINw6qkOk9IlH9FMR/h6
         XEbcil5QLWrARYO9aZRwkCgYKtVeh23vhOwoML51UMuVfmbgWQUXVlcpej5jBqZlvdoE
         kSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788930962; x=1789535762;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Dizj3C/uiB0OjdqiLkkdhcvIiLwfs6+aR2Rr8Cl6Hw=;
        b=GTnrPPm00E6W1dJfz247wd58OCqG57ClRzXGDtm+k9BCZsnyKjASxoefqUC/2YDrvT
         5FUaRpPbuOlIlI3hWC878N2yx7gZ/Qg4j2nsX/74vvNJsdXU5AWGKLEkuoIjcYZEe1BT
         m8Yh1/V9Xbw2hy5G07WN/rm06gS1Pb2rSh7uZT53KxHiJcc8Pt22GHtkrTuBoUHMwJga
         wJkvuS9JffKHhL53n1EqlOOIwobb6YvTxSw4+eV0SavfOZcNZU4KTIc3aMpeSs7Y4oBs
         0ptTKYjJ+gIezCV+kwSrcCl33Bmu6DAlggh0+U0QmH0DHVYrJVA5Wn4CjYDwCPGrrjcC
         5mAQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8UEX1QYJDdNcf64V/aOZ/r0NaK86X56nuZiEwRkFGJ7evjIGGbU9NlkT7RLxltIFQMKgGehKk2DyuDrM=@vger.kernel.org
X-Gm-Message-State: AFuF++mKoeGQnaSlNli1rOCp6H3N8vo4xpJcH9YJHsfJDx9Opz4WWBjA
	f5CKJlzzhLvCk/W/4OLwartbQevC5SRPLmLfPYae1xDKJpsPLYWsbjmZUyFyfVLJw7k=
X-Gm-Gg: AYBFou1erYmR7V81mq18blpBtKi/8jIBRSDuNEttsH3mHhmTwNkO/JqvrerwN9wnhHA
	lNfC1P1UuR8Ghn4AeCcRBmAIVRUCGPQ1dYpYM+2D4OeCxkAkrVPp/UBhq3sZZIkX9+ggNBXP/ta
	5u55F9TbiyjjQIFJ5G9snUzpVBDqvOdmno6ys80jUlhIuRDTzI2FK2lyPjXpirFnvMxqS+R/SG9
	Amsnb0+HoWQpwPlLosiMbHoV5xW/vPlf+5VWrnWlxnM2+/urc/Lrc4ymRzlHMlKGJQTp3My5Kfr
	I1r4P++htGDtXiMFSrP0GwPvrkMqgjzU3ffJyxVH6/7diyCD8J5RiTLidKxizWIry/emQVbxpjI
	Vy03ulY8VarKDaKouhL5huL/I5fafq6WE9vKOwqUZC0sd6pxVwJP72wr8slqjgKfz+g+r9jQXg5
	RlRhJoAugfqm4Xn73+aMsLZZAbwJFk+qIj2l1pKJMbHNRkq1K2nSXjpduReUavGxztuQXDobH7Y
	w==
X-Received: by 2002:a17:90a:d003:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-39b26273a40mr51002778a91.21.1788930961625;
        Tue, 08 Sep 2026 22:16:01 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3397d6d1becsm2904831eec.22.2026.09.08.22.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 22:16:00 -0700 (PDT)
Date: Wed, 9 Sep 2026 10:45:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Praveen Talari <praveen.talari@oss.qualcomm.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org, alim.akhtar@samsung.com, krzk@kernel.org,
	kernel-team@android.com, jyescas@google.com
Subject: Re: [PATCH] opp: fix use after free in _update_opp_table_clk()
Message-ID: <aqDrjQVCy9VkjleX@vireshk-B250M-D3H>
References: <20260908-opp-core-uaf-update-opp-table-v1-1-93d3fc928c5c@linaro.org>
 <dd704898-c51d-46e4-bef2-28d863cdee22@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd704898-c51d-46e4-bef2-28d863cdee22@linaro.org>

On 08-09-26, 16:41, Tudor Ambarus wrote:
> 
> 
> On 9/8/26 3:37 PM, Peter Griffin wrote:
> > dev_pm_opp_put_opp_table() frees the opp_table which is subsquently used
> > by dev_err_probe(). This causes an Oops during boot on gs101-oriole.
> > 
> > cpu cpu0: error 000000006b6b6b6b: Couldn't find clock
> > Unable to handle kernel paging request at virtual address 006b6b6b6b6b6cd3
> > ...
> > Hardware name: Oriole (DT)
> > pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > pc : _of_add_table_indexed+0x80/0xbb0
> > lr : _of_add_table_indexed+0x6c/0xbb0
> > ...
> > Call trace:
> >  _of_add_table_indexed+0x80/0xbb0 (P)
> >  dev_pm_opp_of_cpumask_add_table+0x70/0x120
> >  dt_cpufreq_probe+0x23c/0x480
> >  platform_probe+0x64/0xb8
> > 
> > Fixes: 84f05af0975c9 ("opp: Use clk_get_optional() to avoid leaving opp_table->clk as an error pointer")
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> > This UAF regression was introduced in v7.3-rc1, and causes an Oops on
> > boot for gs101-oriole (in part due to our default upstream kernel dev
> > config having memory poisoning enabled, hence the 0x6b6b6b6b
> > pattern). It is intended that this patch should get picked for the
> > next -rc.
> > 
> > Peter
> > ---
> > ---
> >  drivers/opp/core.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> > index 2fafd983de8f5..c8b941cb81b44 100644
> > --- a/drivers/opp/core.c
> > +++ b/drivers/opp/core.c
> > @@ -1581,6 +1581,7 @@ static struct opp_table *_update_opp_table_clk(struct device *dev,
> >  					       struct opp_table *opp_table,
> >  					       bool getclk)
> >  {
> > +	int ret;
> >  	/*
> >  	 * Return early if we don't need to get clk or we have already done it
> >  	 * earlier.
> > @@ -1607,9 +1608,10 @@ static struct opp_table *_update_opp_table_clk(struct device *dev,
> >  	opp_table->clk = clk_get_optional(dev, NULL);
> >  
> >  	if (IS_ERR(opp_table->clk)) {
> > -		dev_pm_opp_put_opp_table(opp_table);
> >  		dev_err_probe(dev, PTR_ERR(opp_table->clk), "Couldn't find clock\n");
> 
> you can do ret = dev_err_probe(dev, PTR_ERR(opp_table->clk), "Couldn't find clock\n");
> > -		return ERR_CAST(opp_table->clk);
> > +		ret = PTR_ERR(opp_table->clk);
> 
> and you won't need this duplicated line.
> 
> with this addressed:
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Applied with the fix. Thanks.

-- 
viresh
