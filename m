Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7243847F3D2
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203710; cv=none; b=u/y8hDZ66rH+g+AlrHhM0qBiJzIsfCJJ7F8CYicON4NbfpyPJu0acgLSHhkwCXpG6yyQKjzUdDOOwo9Ef5LAbVOdbudRpBuhU57wYeUcFMKiJqZhINWLrxQ5emh9I7ZlMMk9Vmjmg3UHGde4bVEugkF1FkviuDFBsXGSBo8tSzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203710; c=relaxed/simple;
	bh=GjpLzScGvDT5+IF4EJ/jQV9Td5tyjYNGeOCPSv5ZJso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awrywKvrUoa0SCb+4SBLS8WUIj7RhYL3aep+yJhSoaRYY5nYln5nChBC0Nk9wvBq00h3iSiOFAiDn2AatYRrdc0yx0ALPQrpMb2AGh1U80SUFvO3V2Wjx++u4Bk9AGFI8rNBBiWsMQsH+yxygK2pcLJt88Z8ceqwALMnTiaf5hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rqp/7dV8; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rqp/7dV8"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so10931645e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791203706; x=1791808506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MtOkhtouXdYxuMzn6oEg118/G/+iHWMuCiEVkeqGr/E=;
        b=Rqp/7dV8d/rrMhrJ6MAiBPt8bmYPA9b4U84tQb0OA+Cmvwhcby5ZW5eMQVA33N/4X2
         aZvODjWnRc+dX7YZQ0Ji1P5XBacQMTnGQR5FBTvkHXYSBfE64m9j0t+Hc/hM5zpOIUuu
         3dWeHXbCMYeQv6C8mK0zvdYfsZof1L8+eLOaDa4Fq6pBv6IbBUDOiG7fCT8vXz6pGUAR
         AZ+2CkyZzwJoH/Gq+OU0f5LhsHEgJ2s8eCqTUuYx+BUUxJGEPkURJRaXpjv0c6+m5hzA
         XgT2bWGXBf55WTLs0SMJYDfnWD6EgMvRbMf8cNQ3QwzsYmY6vPhPzn6iZy0B+4qKsDjv
         smtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203706; x=1791808506;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MtOkhtouXdYxuMzn6oEg118/G/+iHWMuCiEVkeqGr/E=;
        b=hgRHJpBjqdBha+igQ3jbF8Athrnago99QMqhqEM62as9LJanxo+fdftSfGDhPTkoHr
         PVmBljzwKQmt5wgExqoXAfYnuarq7NGGeZ9aEqlrcfKn8fdhOwxm9AfebeaL8ro/RVvs
         6Zc3g9bjR6VIDW8oUa6ZHDzLC2Yt7pZyRj4SlGAFTjswuEDyZAvKusId4t/dwXyyHVii
         jMpQx8KJWYPcx+gMcpI8BG4zcegq6E2WDjixtVYjOZpGGv76jdOW/X6/AiHXGqwSvnDq
         isTr/UB9d7T/AvPc2WNn+pGVru5gvVdFAEzpwQIZWdqiTaGWMPJH8aZ4nYbSG9MpoZJD
         UNBw==
X-Forwarded-Encrypted: i=1; AKwUvByhRR6WEDU2z34bkKRcWH1WEkPwbtdY6nraXpMJyoxoT73KR/p/sJIbABQ2mnT3MPrrPT7V/EdWRyhNQYQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nkMyKKsYkpthTaxcSxz5uMMJ91lpArcw/G2vvhkMcn701WPyZm
	PqWfQdYOnxJf9HvSOZ4UrEJg98QproHyLaLRUn2ccFxmpDXsFGPg/xb9NQA355hOriw=
X-Gm-Gg: AYBFou0mCvmburwanH6gPpGiGbAvVD4M+v4SnqNUR7+MxJwUrfN07JVBFqWbgNtUItn
	Wkretud4T+aW1m1txOWz6gUwx3twPbhxfe/C90vc5qu70gUZHe/zzeOPwJS2hsOi+SXxiBnCpzW
	GqJU53ZRTIVR/buKAab2ZUtEpLg7qSRy8UpDBnI3yAOF8D1etCQFZWYYX8GZao6MwX8SakEvVs4
	IEo7DnIFt9fEqjc92d+V5XvAnCIKJFXHcphKgNUYIFCJ/6mn7IGKjrKcGIV/ofHOY4mBWXpSy0y
	fEz2Tw9avLU78mB32LkFghlpCEFXbJOUERknSwUmgpU0Sdi/RoszG/b9n+8IsLUpEURguxdXy7r
	Bx4wu+pUpzDafkle+aLK3VBMtIwv8Ovn2II0KAdbP+Mo+QmpSIz8sTeTUWehZBJM3r1idLKjZi+
	Sbdl44X69jMhBvz6A/VjmJtHQfMml3MNvuZ4DHlDFKuBtxcwwGWSuIsVxPM5L2DQ0xootCE2Qzn
	X2J6ViSZfs=
X-Received: by 2002:a05:600c:1f8f:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-4a027698a2fmr183289125e9.21.1791203706473;
        Mon, 05 Oct 2026 05:35:06 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f41:ec49:36a8:7075:6d05])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a166bfaf73sm169425895e9.4.2026.10.05.05.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:35:06 -0700 (PDT)
Date: Mon, 5 Oct 2026 14:35:01 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>, Georgi Djakov <djakov@kernel.org>,
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: smd-rpm: Skip proxy votes on clocks for
 QCM2290
Message-ID: <asOZdcWpfEtEm-5X@linaro.org>
References: <20260910-clk-smd-rpm-skip-proxy-v1-1-1cb5694a99d9@oss.qualcomm.com>
 <dab99b27-ebc2-477e-b56a-26250aceee23@oss.qualcomm.com>
 <ad4aff4f-2d66-425a-a358-6cefaaa1319e@oss.qualcomm.com>
 <bbf2e7e8-42cf-4146-a2ec-b5182a161109@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbf2e7e8-42cf-4146-a2ec-b5182a161109@oss.qualcomm.com>

On Mon, Sep 21, 2026 at 10:53:40AM +0200, Konrad Dybcio wrote:
> On 9/16/26 1:05 PM, Imran Shaik wrote:
> > 
> > 
> > On 11-09-2026 02:36 pm, Konrad Dybcio wrote:
> >> On 9/10/26 3:44 PM, Imran Shaik wrote:
> >>> clk_smd_rpm_handoff() votes both active and sleep RPM resource states for
> >>> every clock, keeping them non-zero until a consumer takes over. If there
> >>> is no consumer, those clocks will remain active in the idle scenario as
> >>> well, and the sleep vote is never cleared, blocking XO shutdown.
> >>>
> >>> Introduce the skip_clks_handoff flag to handle this on QCM2290 clocks,
> >>> keeping other targets unaffected.
> >>>
> >>> Fixes: 00f64b58874e ("clk: qcom: Add support for SMD-RPM Clocks")
> >>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> >>> ---
> >>
> >> Are you booting with clk_ignore_unused?
> >>
> > 
> > No Konrad, clk_ignore_unused is not present.
> > 
> > Irrespective of clk_ignore_unused, the proxy votes are placed to RPM
> > during handoff. If no consumer takes over, those votes remain active,
> > keeping the resource ON in idle and preventing XO shutdown.
> 
> I re-read this and yeah you're right
> 
> Is the handoff functionality necessary at all for non-icc clocks?
> I'm suspecting that this was just a port of the ancient msm-3.10
> logic where the (modified) clock framework had a handoff mechanism
> similar to today's sync_state, except the toning-down of these
> clocks was never added
> 

The purpose of the handoff functionality is to sync the RPM vote state
with the Linux vote state. Since we don't have any "read status"
implemented, we do need to make a vote for every RPM clock to guarantee
it is in the expected state.

Simply skipping the proxy/handover votes does not fully solve the
problem, since you will still leave unused clocks enabled by the boot
firmware always-on.

I don't think we need to force on all clocks though, we could probably
also unconditionally send a "disable clock" after sync_state (once/if
the clock unused cleanup is actually managed by sync_state).

Thanks,
Stephan
