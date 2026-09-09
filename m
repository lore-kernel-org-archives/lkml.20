Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DFE550DB7
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788955840; cv=none; b=c1maImfCQnvUOOHKM0JftwVP8Yf7UOG1EFRP70RdEVwOUxZ+TEtG7sRfe4Jv3/zZXa1P1DDt6GrrmhNqTkktM/9zmDWCFrFBLWY/tLLKmj+vJ1HrzxJSPxEf++OJmJLcGvMjNqBcnhKPQ1EDomH833vlvyfu2lgSQr8LJLE4DWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788955840; c=relaxed/simple;
	bh=DvwtVb5IKeMYxO2D23yno0EzlJiATMbD/Z8h9/0BjRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HbIaSAdppQXZZpsjo5Zd0jVYm3YicJ3dYmDrLlRsdLjoSqMrysFpnOE53P+d54A+LMPiBsSbOi2rKZwFxWFFmleGGfUqFAWieQEss9UXcDA5br8z2gjHPlpNps+DJ0NsAHwSKUud4iWBPF6aApXkDGvDrJTHg5P0wyr85KUEPLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ip69aeoj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wo6A7hnV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ip69aeoj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wo6A7hnV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788955835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vc9MzoiCKhsJwxuQzTyGvb7DKHhftnS4Vlp/tiC9CaA=;
	b=Ip69aeojROhcM41a3ZrVuBrqEE4BM1eWjeUx6JV9xiuWvm5jsZYxRItVb80kMFHdwOeC7p
	trD3io7haWfxeMcN3OHVOL82idznKf5mnMATe/B04kUqvZVGV+5RwYXtFeoc4KZ8wNRZoJ
	MNTNJa2nHsgLBf6NFYGRYMX4i3wXCSE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-bvihPKCgPDmYDa2y9clihg-1; Wed, 09 Sep 2026 08:10:34 -0400
X-MC-Unique: bvihPKCgPDmYDa2y9clihg-1
X-Mimecast-MFC-AGG-ID: bvihPKCgPDmYDa2y9clihg_1788955834
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e7db8d191so128374576d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788955834; x=1789560634; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Vc9MzoiCKhsJwxuQzTyGvb7DKHhftnS4Vlp/tiC9CaA=;
        b=Wo6A7hnVHKJsbmWS0cqt73IAelPQZTFijwj2GoyomEK6JuMv7dSw9eFp3RoS2GmUzD
         qPyNwdnkeU43l9+WNNU/cC+mz5N12n3QWf6Xt53LxApHC+SrUyEsutT8uaDHVIkdPqp7
         5BjU7dPE+kGO19zQJvelwC1bN403xMiPLS6c0OgFJ3Kerpxb6mdYz+NT4SUQGWFB8E0k
         fy6AJ9UAW3X1aNx/EWFXhDi5RgdACF/RHAwCH7VuGSmGzpEkHyEUfZrUiebazvidQHBR
         4oEHEkRdzr/gupysYOxFRZ6X854aYq02+TBmHm1BliEopSEweKGxfBHV6uT95vV5I0gr
         dYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788955834; x=1789560634;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vc9MzoiCKhsJwxuQzTyGvb7DKHhftnS4Vlp/tiC9CaA=;
        b=Qc30QPCn+929J4/0TcwcrPKMq7WGij33NW92ljB0w9Oy1XW/tjWmbJOyYqNi1i0YLO
         a7PQYAk2D0pvlgDphltkOoCgZ2HR5SEs2LhcPNvQLkcCycyexoGQpuAY9B4Bl2B30+RB
         r5ncQ6VyIH4ni7Z7PmrQe/8lWlIZD4GVzh6S4r8ldn9u/cAv4qQOQ4vKU1MN50IZdaFO
         6ZY0z6sKwmknnrbpgcz8kEE3UJt7yZ7FnkhORuZXDTyNX6IYZYIg+ElXXVwL1k/AE+Uo
         vqPmX5k38ayemy5U75xDXNC/oaxpoCIHp9Bc5NihwXWvygKxt6Kkmwm5T4lqzyLx1pYB
         NO4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwxVqzvOSW4CRxZZv4xTVGRW9+P3n657YYBKvyBJCpSIWVEPp3qOolaAszAliRphpoDxzZLg7niCSF5pw0=@vger.kernel.org
X-Gm-Message-State: AFuF++kwnLHY1SkDbkk/s+C2STtUEaqueApWWKWins1Zq0JQZejJkDRV
	nTc624jlhvL7USJF8fa11rcXtkZdTa7IKABy82pOJzUNO2xDZX91n2ah4nt2sTWRkV/zxhc4t0V
	e323zbLTsCXEkc5henHBIIeDfWVaPNRWtzqWjm3xZ6iJrTIIoj0BRB5JJTNbB3r/k+A==
X-Gm-Gg: AYBFou0XaEpzypJb7JZ2af8EM74kGi+oLUBdjKTjnXj5ocKiMyB3Czbdbdh2r4tkpXd
	+AxNI5V1YxSjT1gcKMCNBr1d5vulKR5L21vbVTSPQ8TousLKBPtv2qYgXK/kHIij+SGHGZUDpUp
	EAbbTfT13p9yNB4j3aA8goUFWSe5UOVwCNx+yT93qEDgPOL8ykuq74Et4G6Rdi0WXoMcoVDSQm5
	+HnZBk1yDoPR4Na5bZQi0wFG466L2mJNo8SF2yjnu84C2hfoqV+hTjluxRz1gLF0dklImi2XPga
	tZ6p0B0vP4YcGpbcEzxpliW2PPYlonn9ooy3NWQ+EJ/fuZAPprYu0ncZQankTNz+nACbcbIJetP
	sw8RwaNhLoHOsIUE9KOQy9OpYUA7Abqadl/0=
X-Received: by 2002:a05:6214:6004:b0:90c:e57f:e32f with SMTP id 6a1803df08f44-9103efa2278mr404159526d6.26.1788955833550;
        Wed, 09 Sep 2026 05:10:33 -0700 (PDT)
X-Received: by 2002:a05:6214:6004:b0:90c:e57f:e32f with SMTP id 6a1803df08f44-9103efa2278mr404158996d6.26.1788955833104;
        Wed, 09 Sep 2026 05:10:33 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040663a87sm145367976d6.19.2026.09.09.05.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:10:31 -0700 (PDT)
Date: Wed, 9 Sep 2026 08:10:29 -0400
From: Brian Masney <bmasney@redhat.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: convert drivers over to use
 subsys_platform_driver()
Message-ID: <aqFMtfJINyZyqADO@redhat.com>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
 <20260908-subsys_initcall-v1-3-cbccf4cd4288@redhat.com>
 <yj2cq2n5rexjq6p6xjlxucqk6bolianwg36qf7lfe6zcpd46mo@ue2ulk5scwu4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yj2cq2n5rexjq6p6xjlxucqk6bolianwg36qf7lfe6zcpd46mo@ue2ulk5scwu4>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Wed, Sep 09, 2026 at 02:45:21PM +0300, Abel Vesa wrote:
> On 26-09-08 13:47:20, Brian Masney wrote:
> > Reduce boilerplate code in the drivers and convert them over to use
> > subsys_platform_driver().
> > 
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > Assisted-by: Claude:claude-opus-4-8
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Thanks!

I forgot to mention in my commit description that I didn't convert
three Qualcomm clk drivers since they register two different drivers
in the same file:

drivers/clk/qcom/lpassaudiocc-sc7280.c:subsys_initcall(lpass_audio_cc_sc7280_init);
drivers/clk/qcom/lpasscorecc-sc7180.c:subsys_initcall(lpass_sc7180_init);
drivers/clk/qcom/lpasscorecc-sc7280.c:subsys_initcall(lpass_core_cc_sc7280_init);

Now whether or not they should be registered this early in the boot is a
separate discussion.

Brian

