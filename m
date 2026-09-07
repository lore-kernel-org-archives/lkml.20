Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED0A248867;
	Mon,  7 Sep 2026 03:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.76.78.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788751995; cv=none; b=JHG5/LoK8IBy2s/1fXKR3vFLW0nDQxL+p+E40RbrrPi0+qtKq4bit2l3PV08RdYDbAmvjNICo+MvILwmtAP2ISTRb+taD8EoLKs2oFcdFEuKwTmgOSzSaoGLtvGd+iH1TkrC/oHPibcGKDb08z+GQUT7tG4B0B5xNLD3fSTpClU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788751995; c=relaxed/simple;
	bh=lS6xLwcNgJKHEx2uSZ9LVnga5nAl6lVwu0OzNdE0T64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IFgTGm0GAUhzAdOW3/OsAOqrqmbdpCtG5baNsaHEsWImDQrGEgrKmXQPRwqOE7P/sL8oye/LV1xSSZSfCvaBLdDhKVf067M//hSuMRif8nW/K/1ZK5Xars7KLcfjUPdlRnfIe8Tg6Y9CmwpbiIjhXzLwwVbpZyxGOnqwAnVd7Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=13.76.78.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with UTF8SMTP id IAEQrMDWnrFzMJ5qOjgWAA--.48443S2;
	Mon, 07 Sep 2026 11:33:07 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wDXtNFxMJ5qM6RTAA--.21601S2;
	Mon, 07 Sep 2026 11:33:06 +0800 (CST)
Message-ID: <b325aaa1-7d40-44fd-af90-e022ad78e157@hust.edu.cn>
Date: Mon, 7 Sep 2026 11:33:05 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] docs/zh_CN: Add Softnet Driver Issues Chinese
 translation
To: Siwei Chen <anka@stu.cdut.edu.cn>, alexs@kernel.org,
 si.yanteng@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, wy@wyuan.org,
 Siwei Chen <businiaoanka@anka1.top>
References: <20260824043806.46731-1-anka@stu.cdut.edu.cn>
 <20260824043806.46731-4-anka@stu.cdut.edu.cn>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260824043806.46731-4-anka@stu.cdut.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMDWnrFzMJ5qOjgWAA--.48443S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW3GF1UCryUCF43uFyftrW8JFb_yoW7KrWrpF
	9xGFyfGF4vqFyjvFyxGry7Gw1DGw4xGa17GryfA34Fqr1qyFWfKr17K348KrWfGrWvyFZ0
	yF12gFWUCr4UKrDanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQKb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCY02
	Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s02
	6xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2
	z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0XVy3UUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/24/26 12:38 PM, Siwei Chen wrote:
> From: Siwei Chen <businiaoanka@anka1.top>
>
> Translate .../networking/driver.rst into Chinese.
>
> Update the translation through commit 96fbe161e402
> ("docs: networking: add guidance on what to push via extack")
>
> Signed-off-by: Siwei Chen <businiaoanka@anka1.top>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
>   .../translations/zh_CN/networking/driver.rst  | 138 ++++++++++++++++++
>   .../translations/zh_CN/networking/index.rst   |   2 +-
>   2 files changed, 139 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/networking/driver.rst
>
> diff --git a/Documentation/translations/zh_CN/networking/driver.rst b/Documentation/translations/zh_CN/networking/driver.rst
> new file mode 100644
> index 000000000000..acb0863c6b0d
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/networking/driver.rst
> @@ -0,0 +1,138 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/networking/driver.rst
> +
> +:翻译:
> +
> +	陈思为 Siwei Chen <businiaoanka@anka1.top>
> +
> +================
> +Softnet 驱动问题
> +================
> +
> +探测指南
> +========
> +
> +地址校验
> +--------
> +
> +为设备获取的任何硬件层地址都应进行校验。例如，以太网地址应使用
> +linux/etherdevice.h 中的 is_valid_ether_addr() 进行检查。
> +
> +关闭/停止指南
> +=============
> +
> +静默
> +----
> +
> +ndo_stop 例程被调用后，硬件不得再收发任何数据。所有在途报文都必须中止。
> +如有必要，应轮询或等待任何复位命令完成。
> +
> +自动关闭
> +--------
> +
> +若设备仍处于 UP 状态，ndo_stop 例程将由 unregister_netdevice 调用。
> +
> +发送路径指南
> +============
> +
> +提前停止队列
> +------------
> +
> +ndo_start_xmit 方法在任何正常情况下都不得返回 NETDEV_TX_BUSY。
> +除非设备确实无法预先判断其发送功能何时会繁忙，否则返回该值被视为严重错误。
> +
> +相反，驱动必须正确地维护队列。例如，对于实现分散-聚集
> +（scatter-gather）的驱动，这意味着：
> +
> +.. code-block:: c
> +
> +	static u32 drv_tx_avail(struct drv_ring *dr)
> +	{
> +		u32 used = READ_ONCE(dr->prod) - READ_ONCE(dr->cons);
> +
> +		return dr->tx_ring_size - (used & dr->tx_ring_mask);
> +	}
> +
> +	static netdev_tx_t drv_hard_start_xmit(struct sk_buff *skb,
> +					       struct net_device *dev)
> +	{
> +		struct drv *dp = netdev_priv(dev);
> +		struct netdev_queue *txq;
> +		struct drv_ring *dr;
> +		int idx;
> +
> +		idx = skb_get_queue_mapping(skb);
> +		dr = dp->tx_rings[idx];
> +		txq = netdev_get_tx_queue(dev, idx);
> +
> +		//...
> +		/* 这应当是极为罕见的竞争——记录下来。 */
> +		if (drv_tx_avail(dr) <= skb_shinfo(skb)->nr_frags + 1) {
> +			netif_tx_stop_queue(txq);
> +			netdev_warn(dev, "Tx Ring full when queue awake!\n");
> +			return NETDEV_TX_BUSY;
> +		}
> +
> +		//... 将报文排队到网卡 ...
> +
> +		netdev_tx_sent_queue(txq, skb->len);
> +
> +		//... 使用 WRITE_ONCE() 更新 tx 生产者索引 ...
> +
> +		if (!netif_txq_maybe_stop(txq, drv_tx_avail(dr),
> +					  MAX_SKB_FRAGS + 1, 2 * MAX_SKB_FRAGS))
> +			dr->stats.stopped++;
> +
> +		//...
> +		return NETDEV_TX_OK;
> +	}
> +
> +然后在 TX 回收事件处理的末尾：
> +
> +.. code-block:: c
> +
> +	//... 使用 WRITE_ONCE() 更新 tx 消费者索引 ...
> +
> +	netif_txq_completed_wake(txq, cmpl_pkts, cmpl_bytes,
> +				 drv_tx_avail(dr), 2 * MAX_SKB_FRAGS);
> +
> +无锁队列停止/唤醒辅助宏
> +~~~~~~~~~~~~~~~~~~~~~~~
> +
> +.. kernel-doc:: include/net/netdev_queues.h
> +   :doc: Lockless queue stopping / waking helpers.
> +
> +netif_txq_maybe_stop()、netif_txq_try_stop() 等标准宏已经过充分测试，
> +请优先使用它们，而非本地同步方案。
> +
> +无独占所有权
> +------------
> +
> +ndo_start_xmit 方法不得修改被克隆 SKB 的共享部分。
> +
> +及时完成
> +--------
> +
> +请谨记：一旦 ndo_start_xmit 方法返回 NETDEV_TX_OK，
> +驱动就有责任在有限的时间内释放该 SKB。
> +
> +例如，这意味着不允许你的 TX 缓解方案在没有新 TX 报文发送时，
> +让 TX 报文永远“滞留”在 TX 环中而不被回收。
> +这种错误会使等待发送缓冲区空间释放的套接字发生死锁。
> +
> +若 ndo_start_xmit 方法返回 NETDEV_TX_BUSY，
> +则不得保留对该 SKB 的任何引用，也不得尝试释放它。
> +
> +错误消息报告
> +============
> +
> +许多驱动配置接口会向驱动传递一个 Netlink 扩展 ACK（``extack``）对象
> +（直接作为参数，或作为参数结构体的成员）。驱动应尽量通过 ``extack`` 对象
> +报告大多数错误。表示系统或设备行为异常、处于不良状态的系统级异常，则应继续
> +报告到系统日志。
> +
> +消息应 **要么** 通过 ``extack`` 传递， **要么** 写入系统日志。驱动不应
> +试图将同一信息同时报告到两处。
> diff --git a/Documentation/translations/zh_CN/networking/index.rst b/Documentation/translations/zh_CN/networking/index.rst
> index ae374c4cb144..4675d23a7f28 100644
> --- a/Documentation/translations/zh_CN/networking/index.rst
> +++ b/Documentation/translations/zh_CN/networking/index.rst
> @@ -21,6 +21,7 @@
>      :maxdepth: 1
>   
>      msg_zerocopy
> +   driver
>      napi
>      vxlan
>      netif-msg
> @@ -76,7 +77,6 @@ Todolist:
>   *   dctcp
>   *   devmem
>   *   dns_resolver
> -*   driver
>   *   eql
>   *   fib_trie
>   *   filter

