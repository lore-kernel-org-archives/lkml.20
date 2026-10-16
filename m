Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD46D346A0C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792124319; cv=none; b=SyfW1y71xYfOMT+yeFJ0dAFyVA0/EWTsvsORriLX8ofLwTpVsPMNl38qhsYtu07Jp4mHO9rrEVr0OjxfBmIx2cHTCipGyOP8CYFwe55UxpOEROdfNaOXdw88Gax1+nX66Ndmui+4GJSEkv8QEU0oX+QpPTnjfxoTuCRPbxK66ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792124319; c=relaxed/simple;
	bh=SAgAlVumd4bSNcq7POTdK2o5SfAl7K4HhN0qAdrkl68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFwnn7/yMifExhGrdpnmfZ5ciRWhl/R6buLPilQsRMUQ382zpOWr7N9u9uQ2XjgBC8MmuN2GicB+IdEwrdwC61QsF5ogCFVok9zYf4PuErLLguZ3sQDwj67zrK1NLczMkd7p9qcbnY+F7rBwPae0m3xg0ERjHfZSipRS+87jKBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PI/LPUma; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PI/LPUma"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7fccba9c675so909833a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792124317; x=1792729117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L4MYjMxl4nk9/tU0R8Bn0SAxgenA02VkldF0zXaf2oQ=;
        b=PI/LPUmaQqkqDv81HV68nr3ejn8LYdN/bZYAn52zawy1agZ3fNb/UyQrRK09FowflA
         bqcfqxCX3eyucP87tlb+uEc9uB5yJjR913gfskFyTY1+TbedrvKCV5U6X1LV6gH2LS8t
         RNCp944+uVSx2Sy7hXZsjXr2Nao+AeW0CMFMYwvwGvBuUKA74gZPl0kWsLw3dWfSIvgd
         k6XscpJDZ9uCQZc86tniyYws5XyDSBjap3d6RIklnpkYFcVSgRtultdYFcehYRzUyMKv
         addTjdbDNmHD+TMCnB9J1Djvj0CTP8fNPYXJTA/RWdhdtj3PP9ST65UrUW62/Gq5h5en
         Zn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792124317; x=1792729117;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L4MYjMxl4nk9/tU0R8Bn0SAxgenA02VkldF0zXaf2oQ=;
        b=1kIBL+Yk3mtvYEDEIIMlLKcILnUhT/z4Fk/onlqS116GeONUL5zPvUHvl/lWDn9wx5
         GV964AMOKopEkpqtzHcf3TIQx+UoHwDjWQEhw1e2qCQozu0AMFL+jYpy4ZSb2fm9ZEgg
         j6I9Brh4TwMcBBa45J8gKzbckKOqcNWOaMsi1LkQ9KOUiFW1hNRjuzqxZG7ElS8sU+L1
         WaD81ClEGOAMqtko9Ll6b5uFo8TSQtKm/XeBgoWWp/RHjuYPvQjTediIhssAoOgnjXdM
         wWLF8Gy1EVsqv0iCqEnHjLFwMlGxG4+2JcIauGqpULQuSrEyJQm+DKONT255p2sBYU6L
         UDbg==
X-Forwarded-Encrypted: i=1; AKwUvBx0hIC/5viTl7lQ7ITkz252+UGx+jjQ6LJVag4pVB//RjqDNL2STCwSUmOgLbL7ea1WyqN/icP6I5j1gtQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSFYqQ8oj9HSPu8qab4GrdVS4ZBui8r86khItkl/kP+LIHLex5
	sbIyRziUCvxeHaUCXl2MegqHOPLEloHgNBBw83FtvAX0ySuV+k2jcY64
X-Gm-Gg: AYBFou2ECQnYfCBSh1WUi9YSe+mkP2PbZ6H5tl498PPeEaY7xQEdbQ+rFV2mGB3VgME
	tCJjDbT7TriQcRi2EysSWPofR7JKqew+NRgaR9dCs8rbL+w2RS2O/o1QhZnE2rA7TcQfVIONx/3
	sgg8ij9VAatbwtbyxzyd2FRc7bKDGE6nl6DnI+OtBXYZRr4trnnz7hhOBVDUfFjToc0H2uzDeq8
	VEuF7IfbGavMmtx/u7PAIvnG6PBCPJqG4vtwRmuamklxhaLwJ3dzEtsdBM6uG1brZjgBhD41xDn
	dNyO/hpfyGIAU3AjOjNW2ool56SBSqxP5c9ydFyStf3SVnao92mAXLpRbLAPyCE0ksP/IOieaJc
	m9KRjxZynW2BrgMkpkLgfAk/shKTJV4dNBdPMNv5eLMAA6Wvlp8IWEC3FkHUHzpHCtUL8kAt1tM
	Iq4889oJtHvavVsNbKZsmudWSIWTaQy3XsmzYlgro0ZWB9wQGTCrp6noyrOoqK5ylUb7TDwJjXe
	TqrThqLyx+6o5IN2q7xETmhFpoQrpgpPQr4ZL8MDip9XRbU/wZRl3Py2ZeIc2tgi/KZgKUxvaIG
	9W4=
X-Received: by 2002:a05:6830:a20b:20b0:807:2dcf:5353 with SMTP id 46e09a7af769-842020f96a0mr949776a34.35.1792124317643;
        Thu, 15 Oct 2026 21:18:37 -0700 (PDT)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a111dda4sm849120a34.1.2026.10.15.21.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:18:37 -0700 (PDT)
Date: Thu, 15 Oct 2026 23:18:30 -0500
From: Ming Lei <tom.leiming@gmail.com>
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Yu Kuai <yukuai@fygo.io>,
	Hannes Reinecke <hare@suse.de>,
	"Martin K. Petersen" <mkp@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] blk-mq: drop the tag_set argument from
 blk_mq_free_rq_map/tags
Message-ID: <atGllms8KX7X6Fk-@fedora-laptop>
References: <20261001-bug-blk-mq-global-tags-srcu-v1-0-e8415da10d1b@gmail.com>
 <20261001-bug-blk-mq-global-tags-srcu-v1-2-e8415da10d1b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-bug-blk-mq-global-tags-srcu-v1-2-e8415da10d1b@gmail.com>

On Thu, Oct 01, 2026 at 05:17:51PM +0800, Qiliang Yuan wrote:
> Commit 9ad8e5af3279 ("blk-mq: Pass tag_set to blk_mq_free_rq_map/tags")
> added the argument so that both helpers could reach the tag set's
> tags_srcu. Now that the SRCU instance is global, nothing uses it.
> Remove it.
> 
> No functional change.
> 
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>

Reviewed-by: Ming Lei <tom.leiming@gmail.com>

Thanks,
Ming
