Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F2236606A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376088; cv=none; b=I/6BgnhMwGQBkdsPFyH9Fv7T8n5j91TU5stcVI/VTkSGWLQZikGWQN+jLAOl1Z62lix5gD7V8BYdJKKUXWtOpwIf8Q0I+oth1+YenFWbuoEu3JJuBC4tKVIharn++Bkx7fVLk7UaVRGAAy86exWh7jhobKyrxIZBxB5XDW8YnQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376088; c=relaxed/simple;
	bh=Oex4lP6M1jAXUHgnrRyELQLIdsFXA2FcI8B6FYB04/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=epaNhOKp8tV/rxwH6HlxKmHnLuv0Dxc4bsfGCeg5SAtXSXempaPDUrvGAjjFmdlCbBXsJHv6zlRkXaWH9vdSdxJhyJzZn9dq3oV0fouD8/K2+MlCrYwpO2QTXOpbQMwskNIXQQKFLLzpwLSXY7goXA0QOO5wwidTnCwUy/5PIII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8Dh/H9g; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8Dh/H9g"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6056be4d2so1419986a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789376081; x=1789980881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=61OP6MUp9ANJJBq18hSWE5M/OYvgWHC2avjw9EhrCSI=;
        b=h8Dh/H9gyyLcDBVnBPk858zgxPocqSfXaC0BWIMAtTZqT1GZpkI0h4wR3FqKIzx/X6
         HMnbebPgCx+sH3Wv58YNmLZ4p6xQFekmD3Os0tQ84VUr0TAWLxwijyQ6+QLWRVMm8IWg
         ZtHMnwBP+ojBTO6rjvYGT9weW5kBmpgjben9j7ixEu29i3djbKejqsXwv0vI5lcWi+JP
         Chii9V7obH1y3W3P5d0Swiefyz67kOqIpylPI0pnDQYXtMecyE+Nw6EP3zGL1QPksyVq
         WUeHmqZ+JQldB6oKHtw+XHFIzZhW8kAlHnKwyw4YTTSkdNKJhhuPT+qoJgxHFp5G+Z3r
         o1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376081; x=1789980881;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=61OP6MUp9ANJJBq18hSWE5M/OYvgWHC2avjw9EhrCSI=;
        b=R0I8RE5t/3HmQQHuhXTv38iKUWMJhR2DtOS3ynjYyA5zsIqfQn3HVYfh495wCL+NSZ
         lGjpyu/4uvy3fZCJhM+h9c5zIcq8EneTI3YDKN7w2nIwSNdcCV/wS1m5Rb8edUHWyMej
         R7LsfCWFtNilBbrHm3rU+aG2SClgSkXCf8l3VzkgP3VNhr9KZtY+eSYYETOABWt9/tnZ
         JV8WKSOwNMSUCr3le0ZZ0/JlfzCPY8UQnHv8+jA84sCghcUlSAKcUprh6MM5dSV44jHY
         zK+z/GBBDR+r/+yEzPOUisny87EXcM3dhzMxkZhUysQKwDuTOdd8qNGRSM1ePt4ucmFa
         9usw==
X-Forwarded-Encrypted: i=1; AKwUvBxvGeclBCHAYB1VMatu9iA/8nEhKNAwpJtMfksxrx8K9Y8wmtbGUKv6OWxKFEVMrxJ57/rI8mmgH71jxoQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nVFsJAv8R97sRkwOlrVqBzdgdOAeyaxKCQV7jRxTsaSAYO2VY9
	yTUjT5ciMSBGWJtNHWDOZfyaNbYu+gVnwl/aFIV2zf09Fv6wV4b7lt7i
X-Gm-Gg: AYBFou2VJ2EmZ5dUYLOfX3i9yIZI6lxhLWWVa5JPwBYx35Jaoth8HaEv/PRMR7LaQEB
	0GSEW77OKyNVa2niz7A3+0EW7AOZ8atkdixtVR7WbNE8ERWKtcsczUS8Ba8yVj0zwwSqLEQU+Cx
	itsQkKM8uNeY3XxtrX4pR26L3Rqk6dujzLcC/CqGJUgHblWZ5VZiag8n6GJE+q1BaJ3tNYw2C7I
	zXleBWrBHJ15bTQvcwVltIEGX3tHT/dU0XG7gziSx/QuScXqw1dDJBEy/yGhRYv33JRWH1xCtXS
	ZuEn9uyDh1OdTdQk44ldNG5p0kR8L8DZHf0YH9st+VUdVFuq5ShEYW2/ANQ38wo670XqBSM7ukN
	X8EwQDXs5zjeEwRlEw7olyHy7Sokd6ooOuvRVZlEr7g0axjZMtzyt5yeKv84/y6Aw9odkZ7YjRY
	Tu64DgoomMUAJ9WGoZgPrrRkgji91NZsCOtvjqYxlAgbmNDW1FJsOaWPDi/N8bP2S1Id5Yr82ES
	a3wDQ==
X-Received: by 2002:a05:6402:450a:b0:6a6:32e3:9ba with SMTP id 4fb4d7f45d1cf-6a9f652d7e2mr1058343a12.10.1789376080524;
        Mon, 14 Sep 2026 01:54:40 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9bf18d240sm3677157a12.6.2026.09.14.01.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:54:39 -0700 (PDT)
Date: Mon, 14 Sep 2026 11:54:36 +0300
From: Dan Carpenter <error27@gmail.com>
To: Gabriel Changamire <gaberashawn@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: sm750fb: clean up sm750_hw_imageblit()
 kernel-doc comment
Message-ID: <aqe2TCpR7FSoykOE@stanley.mountain>
References: <20260913040140.4517-1-gaberashawn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913040140.4517-1-gaberashawn@gmail.com>

On Sun, Sep 13, 2026 at 04:01:39AM +0000, Gabriel Changamire wrote:
> The @start_bit description contains a stray ">-----" artifact -- a
> literal copy of an editor tab marker -- that leaves the continuation
> line "0 to 7" garbled. The @fg_color and @bg_color descriptions are
> also missing their closing parentheses.
> 
> Replace the artifact with a plain indented continuation line and close
> the parentheses. Comment change only; no functional change.
> 
> Signed-off-by: Gabriel Changamire <gaberashawn@gmail.com>
> ---

Acked-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

