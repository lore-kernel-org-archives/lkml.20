Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41F1390CA6
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657682; cv=none; b=pP+jnOL5R3AOyxPeyNqr9KqDOwmXC4uhuV4fX+jae8eTLaIsvMjftf55bQtn/hQiRGPAVesXBsrcx8m1/Nz619p8DuHa3v8Z5PpSBMwNCYxS9IKZPISci2YQDjp3wcCjrjwc1x6MOLSJH+4OJiGdhx/mTVUbr/bw7wrJ32AstPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657682; c=relaxed/simple;
	bh=puhBDsPAB2d2yNXgFPi6/Kxk4MWUwb8s4nQjU9ngqWc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=G0/Xae9r7xqAe7WfVIkkK9nb3siZWrm1qlxieKbowrqjX1sHDfCU9q0YUPgKk6IyM/hI2kCMwuEuSA1jcZdLd7JISe9elBAZZ4be+jWVp+O3NvCwSlLX+VEynCvruXXp0hEq25fv9knvk0KX30VqbpIoxkKSGXK9GHsqz5l6Des=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qr836y6D; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oDzlNtwu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qr836y6D";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oDzlNtwu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789657671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aJWfRz/qUQ+jC0/O5zIduIK06j1/9KJXZaDkdj0AX0s=;
	b=Qr836y6DqCgPTLwcvVp8taBKQUSdhYJMI9sBOpAG1fpPH3L/ImGcf+WbYcuPsbgCsAuAGV
	HBUQ1xvikVSB9/3FEUEOFntlX65PlAl7qgT8OdUsXdvhSE269ZUu76xwVIac8lsx+ZCXtx
	K6BqmmrtPGrKWCvQzzMAVLng+597AIA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-eGgPTJR8PzmtvWWjGBRkWw-1; Thu, 17 Sep 2026 11:07:50 -0400
X-MC-Unique: eGgPTJR8PzmtvWWjGBRkWw-1
X-Mimecast-MFC-AGG-ID: eGgPTJR8PzmtvWWjGBRkWw_1789657670
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9104eedb5b0so17764516d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789657669; x=1790262469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJWfRz/qUQ+jC0/O5zIduIK06j1/9KJXZaDkdj0AX0s=;
        b=oDzlNtwu6D7NTlCS+FLscVMhjbGjdhc+Gty+Ut1XYZyY7vdvl/HP9Z0Mve/ui2knkQ
         FjpOmFIXKfspLfZlVhQXNK7XfwnsoNB333blzQ86or4HIuWpPuMU3tFablDu6qr1e1xD
         5RZ4VWR9+/t3MUvWbVOFdFsxuhyv/MBNQA4EN/UPBoK2XxBL7cSpJ/P6ubsAPzw+daN8
         sxZbD4yLfaFlHhPztp0Dl3gqnXFtWU21vpGWmSFvc7dXwOa8l5Gxw1QonQpPVo2j7Xot
         hhAsYLp8ueHDWbKh6QzHCpcebLoxT4I9q21PlNNUOMcNJH2N2RhSslcAMyXBrb8aYW7h
         6hOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657669; x=1790262469;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aJWfRz/qUQ+jC0/O5zIduIK06j1/9KJXZaDkdj0AX0s=;
        b=il99RRwVggQrQwjG3UnQBlLyvp2c1kLEjYyuPqtUunU3yIymG4o+22iwmJp+Wa+gVc
         BM2bpl/T94k8/0ReLdi5OBzqaQJu9+XdadzeqaR2vR0v3b72VQY08TJzhgKD6zQ8nsv+
         kOUJtf2G0QiEZQv7DmvySk4G3pjmbJUlX+Wg1djSAz/M/2vkymvTsR47f7er2lpToWzv
         sPR62KZ5TgoXyEqs9xvZh3qvuAd78uXFc95FCRoL+bePe/dQamUXctTxCs13gKIWn0AT
         XtaUnQYYP72zx2bXK6BU9JBtccuoHIC22XzsfVcMiS5sV1hI5iHrVT295HAa8vh+eV3M
         1rHA==
X-Forwarded-Encrypted: i=1; AKwUvBxEOxpeCOl2eSehBkMQTmeQ0YMfOp/yVIZPMeB2KobzdqykWhvaMVSDhRUwiINGLOyr7RfARZ+C1viQ56Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lhwbQGkjxBKuR5R3Xorzho5wJRTfVxV76Km7LyCyDUvG5QJjDL
	1OobL8dRtSYVpEcMmdfn25mWQyv9R2Sbc/9U/eLwM4+OGg9TxZ/ra4qdokAWAxCg6l/A2MrpRmc
	ZpZp0jSybRayYhabRmgwYEoYP9zlnCmR7XEep8/RxIDS5uWqNNXSanS1vxlmV6zGhlQ==
X-Gm-Gg: AYBFou3ErjJlvdStLYerFlJ2d1lEM0JEFs9ThtE7cYAbFy3m8R/qUND2qmYGjl1PNvT
	itL9Tx4GFDJxtLhI5N77hJPySu0kzYr3Y1CIPqDAyQyZ/L5UgzFE53YTm39waO4h1ndN+P/U0ob
	ZaaHY0UNk9yX5Tny6YRb35aXK/YBH6hf3JERBaGqujBKL+SYs868DpUnmIHtass/sKOagalfdTe
	HCXJu+Hyd37xzq/Ny1tDhc0EB5MKOZ782zDhdOnYctbtI1/Jwd8RJcG4Ad8JSoeh1ZS066Xy8Uq
	szDmROhBiFuki7GY9F9jv2FLQI1RZ/TmrHGz++45BNKzkeFX9l/nCFnVT6PGxjuQgPHbrzhk1uj
	C1gvARkCDT6GS7az0qQQ7tOqms0J/UfVmndHPIQA=
X-Received: by 2002:a05:6214:2528:b0:912:3cfe:2dcf with SMTP id 6a1803df08f44-9123d722381mr122578626d6.4.1789657669510;
        Thu, 17 Sep 2026 08:07:49 -0700 (PDT)
X-Received: by 2002:a05:6214:2528:b0:912:3cfe:2dcf with SMTP id 6a1803df08f44-9123d722381mr122577906d6.4.1789657669090;
        Thu, 17 Sep 2026 08:07:49 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123beb4884sm53020536d6.37.2026.09.17.08.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:07:47 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Pengpeng Hou <hppiscas@163.com>
Cc: Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260906033924.84982-1-hppiscas@163.com>
References: <20260906033924.84982-1-hppiscas@163.com>
Subject: Re: [PATCH] clk: milbeaut: Return divider update timeouts
Message-Id: <178965765056.360090.17314142622981965069.b4-ty@b4>
Date: Thu, 17 Sep 2026 11:07:30 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=294; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=Zw0k9Wy8piJ6fXZzS55E7Sk9e3u/FCgs7eWCZAOw1LM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLWMFkzxxy8tU/vtPXT5zMC10rp8Xi55LyM3ls241nW1
 47Vx17e7ShlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiW14y/A8s+zJz+29Hoe75
 rBftzdJOZLttuj1l+Zq+Jwrfw3QNUm4wMrQELLB+OmHS3l3LC2e3H7riUzHl6faCFwLHe66fC7S
 av5cJAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Sun, 06 Sep 2026 11:39:24 +0800, Pengpeng Hou wrote:
> clk: milbeaut: Return divider update timeouts

Applied, thanks!

[1/1] clk: milbeaut: Return divider update timeouts
      commit: 526066a4bd5658962800fa64bd3e5432e1f7f92b

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

