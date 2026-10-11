Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27FB19DF6A
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 04:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791693951; cv=none; b=Un15Rx7MqNLlCaB+eLOTxfzDr/j8WIDJ0fCHMnVAjpCTGjgH8pOGjpuc7LmbUin0cItCdRNA8dKqIaODXV67ilExzO/dzsoBdKJpPaQA6pt3a0qStTyE2HZa60/mlTMmKnRk1mI5jamGIJAKPO6lt4ZuNuE8z4AIS4riy0pYUiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791693951; c=relaxed/simple;
	bh=mjLp7zGDjcj+lWq2bQZ2AdxPlmTKABqImeXoPORHywA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YR7lgozcO9TiQLMnWYKJqsUHZPsjJUJv/1qi22D8phJZ4vtAfWiYPLq/EQZS7auDswArhYALKaN+MbFVI9zqEM7mKQ5BQJOsUOw7bNnMU0d1SG/7ZI7GuH6F4dMIl881gUVZYdjS6ZeX/uhO8+bQz8EcVZx36tCg6ZL2ZvStcYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZLZimdj4; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLZimdj4"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3514b90bb89so1647057eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 21:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791693950; x=1792298750; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UboHhp6ztrYdIlQJYxWz3PqYJoK6i0hu7qVE9ptfsZE=;
        b=ZLZimdj4Xgd70easqAY/MeZ5KEj2OBJDd8ar/eFBPW0b3wdAsWQRizoQlpZYfrkQVq
         M4aCpA2O74HBA9P9Nbu9ikrYhhNKIAhpoB9zCVw87iKzlUOTwpIPHo6sn3Ze1bhSprin
         6QOTNOx1gmVpO7I1zTveIQsLolf6haGWVPbA52VdTtw3aQGUyhTVSt2jebBqKVXmsIWv
         AvhcpqobtCF/ddZTn7mN/urphvd4Jc3rHOxRHGUumc26i431RgVAAOIKxsty2rpzWC9j
         0esB2KZmPJmbelDZEn0/R9uTnMgHPWiiTRVNBPzJPxKkWCICsLcYfA6nF1BRXGpwa1pb
         yNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791693950; x=1792298750;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UboHhp6ztrYdIlQJYxWz3PqYJoK6i0hu7qVE9ptfsZE=;
        b=zT+c07Z+AtAO1BqU08gXkiNNUn6VOyzJeAXVcpdt/DkwgiKVLpktWM4pBBE0MgYQc5
         cQjHSM7Qt+ZpJ62Wtd/CrZ5XyU7eURU+TdUVqNcZo+TABREma20+mQuLo70XBU4BhvK9
         BgYMEhKs0q662a7byqxm/BELrjAQ3DCY1n6pvn6B21DKyloO48kcuQJtxD3FPLKfYKGq
         WGUSmwInmQsfXktE2sD6O5m9BkChbz6ZAe2ZhahGdyNy4fsx6WRmB39/DivbdQW7PxVE
         uTDvAbi/8LXxPL0uzwCh+ymlqpUqty5jPX/Ng3bw/DaszvsooQNT4l+Sfr5WVDmaaZlj
         M9ew==
X-Forwarded-Encrypted: i=1; AKwUvByEeUtsGVOt5ODBkBOnsfYYiLrFkzVGdu2vipNb9orxk9Cveca2SFcxZavWoLO2Cc5FcfaE2emKCNBWb50=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSY4eNexk6DgMG8d3hzfLm7q0wFbgb3Q98Gx2rV2Fa11bzgmHv
	edDpco2aAUaQOu57cWjf3GMyifiFkGWmZoz/Gzs2/i27stVys4k1Sp8VP+/nmVE8
X-Gm-Gg: AYBFou0V6n36V0WZoTvGGv5MkWEn2DrK4FGH8Xk/GkZtwyHcP+JLtV/HWu4m4w3yjSC
	kosB/juLbfun6FtYZ1T2cYXTq4S8UWD47pquV0Y1CRfGpZ/aNRF+AvWG7QzuiyYdONAhcoviMRo
	E8iODA1HrBbqVCP4g+qTC5vjDUcxVMtFurPSPgotwe+qvNyT7K3PFoBhbNa+y+cGKj9PGFBZCc2
	ADoOv6o+KbgxaxLyIGPs04aaYinrTR2X1wTBEQQLKm6dyUz6l58Sr4wn0z5XjQt3wo40wj99/IK
	HWO3kAM0hX4pWq9fc+2WPn7CLdRGQMWUz9rcaFGptZOWPsaO/N/qFSDz60OZNhBgy1IMuWH8ess
	vm4OHdOSBTx7gjlNy36HsQvy/2hDcC0askgN+ajxD6LcDuogwBv9GjPZUv22kwDbeu+gB1zjo/T
	b7rSnyyQGhZtPI8OUNfqvGx5bA7bdGyhT7d1cmWXh+rLM8bOguC8QbhN3Veu61BV1S5wIOohyuO
	AErZCTRwLXqHX3zIivdt5XWpKlLpnYl6BPvySU9
X-Received: by 2002:a05:7300:f582:b0:34d:755b:d60b with SMTP id 5a478bee46e88-3537e048b67mr8414896eec.34.1791693949428;
        Sat, 10 Oct 2026 21:45:49 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:99d7:6eb1:9874:c6be])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca0e64csm21542311eec.10.2026.10.10.21.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 21:45:48 -0700 (PDT)
Date: Sat, 10 Oct 2026 21:45:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Karlos Abel <kabel@voidship.net>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Input: discard pre-registration events and test
 state seeding
Message-ID: <assT056aFmzMHmON@google.com>
References: <20261010180031.7-1-kabel@voidship.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010180031.7-1-kabel@voidship.net>

Hi Karlos,

On Sat, Oct 10, 2026 at 02:00:29PM -0400, Karlos Abel wrote:
> This series prevents input handlers from receiving buffered initialization
> events after device registration. On a ThinkPad T14 Gen 6, a later LED
> update flushed a stale SW_RFKILL_ALL event seeded by thinkpad_acpi.
> The fix drops the pending events and their timestamp before handlers
> attach, while retaining the seeded switch and absolute-axis state.

Could you explain why these seeded events give you trouble? Is it
because thinkpad_acpi() forgets to send input_sync() and so the
timestamp is stale/wrong?

Thanks.

-- 
Dmitry
